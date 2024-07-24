<?php

namespace Modules\Auth\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\PasswordResetToken;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Mail\ForgotPasswordMail;
use Illuminate\Support\Carbon;

class AuthController extends Controller
{
    public function route_back()
    {
        if(Auth::user())
        {
            return redirect()->route('dashboard');
        }
        else
        {
            return redirect()->route('login');
        }
    }

    public function login()
    {
        return view('auth::login');
    }

    public function login_submit(Request $request)
    {
        $this->validate($request, [
            'email' =>'required|email',
            'password' => 'Required'
        ],[
            'email.required' => 'Please Enter Your Email',
            'email.email' => 'Invalid Email',
            'password.required' => 'Please Enter Your Password'
        ]);

        $credentials = array(
            'email'  => $request->get('email'),
            'password' => $request->get('password'),
            'status' => 1
        );

        $remember_me = $request->has('remember_me') == 'on' ? true : false; 

        if (Auth::attempt($credentials, $remember_me)) 
        {
            return redirect()->route('dashboard')->with('success', 'You have successfully logged in');
        }

        return redirect()->route('login')->with('error', 'Invalid Credentials');
    }
    
    public function dashboard()
    {
        return view('auth::dashboard');
    }

    public function logout()
    {
        Auth::logout();

        return redirect()->route('login')->with('success', 'You have successfully logged out');
    }

    public function profile(Request $request)
    {
        $user = Auth::user();
        
        if($request->isMethod('POST'))
        {
            $validatedData = $request->validate([
                'first_name' =>'required',
                'last_name' =>'required',
                'email' =>'required|email|unique:users,email,'.$user->id,
                'mobile_no' =>'required|numeric|min:10|unique:users,mobile_no,'.$user->id,
            ], [
                'first_name.required' => 'Please Enter First Name',
                'last_name.string' => 'Please Enter Last Name',
                'email.required' => 'Please Enter Email',
                'email.email' => 'Invalid Email',
                'email.unique' => 'This Email All Ready Exists. Use Another',
                'mobile_no.required' => 'Please Enter Mobile Number',
                'mobile_no.numeric' => 'Enter Valid Mobile Number',
                'mobile_no.max' => 'Please Enter 10 digit Mobile Number',
                'mobile_no.unique' => 'This Mobile Number All Ready Exist'
            ]);

            if($request->hasFile('profile_image')){
                $image = $request->file('profile_image');
                $image_name = date('dmY').rand(111,999).'.'.$image->getClientOriginalExtension();
                $image->storeAs('public/profile_image', $image_name);
                $user->profile_image = 'profile_image/'.$image_name;
            }
            
            $user->update($request->all());

            return redirect()->route('profile')->with('success', 'Profile Updated Successfully!');
        }

        return view('auth::profile', compact('user'));
    }

    public function change_password(Request $request){

        if($request->isMethod('post')){
            $this->validate($request,[
                'old_password' => 'required',
                'new_password' => 'required|min:8',
                'confirm_new_password' => 'required|same:new_password',
            ],[
                'old_password.required'=>'Old Password is Required',
                'new_password.required' => 'Please Enter New Password',
                'new_password.min' => 'New Password At Least 8 Characters',
                'confirm_new_password.required' => 'Please Enter Confirm Password',
                'confirm_new_password.same' => 'New Password & Confirm Password Not Match'
            ]);

            /*validation FOr request
            - Old password req.
            - New password length/req
            - new password not same with old password
            - New passwrd same as confirm password
            */

            if (!(Hash::check($request->get('old_password'), Auth::user()->password))) {
                return redirect()->back()->with("error","Your Old Password Does Not Matches With the Provided Password. Please try again.");
            }
    
            if(User::where('id', Auth::user()->id)->update(['password' => Hash::make($request->new_password)]))
            {
                return redirect()->route('change_password')->with('success', 'Your Password Updated Successfully. When You Login Use New Password');
            }

            return redirect()->route('change_password')->with('error', 'Your Password Not Update. Please Try Again!');
        }

        return view('auth::change_password');
    }

    public function forgot_password(Request $request) {

        if($request->isMethod('post')) {
            
            $this->validate($request, [
                'email' =>'required|email'
            ], [
                'email.required' => 'Please Enter Your Email',
                'email.email' => 'Invalid Email'
            ]);
            
            $token = Str::random(64);

            $email_exist = User::where(['email' => $request->email, 'status' => 1])->first();

            if(!empty($email_exist)) {

                $insert = array(
                    'email' => $request->email,
                    'token' => $token,
                );

                PasswordResetToken::create($insert);

                $data = array(
                    'first_name' => $email_exist->first_name,
                    'last_name' => $email_exist->last_name,
                    'token' => $token
                );
                
                return view('auth::forgotpassword_mail', compact('data'));
                Mail::to($email_exist->email_id)->send(new ForgotPasswordMail($data));

                return back()->with('success', 'Forgot Password link is send to your registered email id');
            }

            return back()->with('error', 'Sorry Email Not Found');
        }

        return view('auth::forgot_password');
    }

    public function reset_password(Request $request, $token) {
        $token_exist = PasswordResetToken::where(['token' => $token])->first();

        $createdAt = $token_exist->created_at;
        $isValid = Carbon::parse($createdAt)->addMinutes(10)->isFuture();
        
        if (!$isValid) {
            return redirect()->route('forgot_password')->with('error', 'Your Reset Password Link is Expired');
        }

        if(!empty($token_exist)) {
            return view('auth::reset_password', compact('token'));
        }

        return redirect()->route('forgot_password')->with('error', 'Invalid Token');
    }

    public function reset_submit_password(Request $request, $token){

        $token_exist = PasswordResetToken::where(['token' => $token])->first();

        if(!empty($token_exist)) {
            $this->validate($request, [
                'password' => 'Required|min:8',
                'confirm_password' => 'Required|same:password'
            ], [
                'password.required' => 'Please Enter Password',
                'password.min' => 'Password At Least 8 Characters',
                'confirm_password.required' => 'Please Enter Confirm Password',
                'confirm_password.same' => 'Password & Confirm Password Not Match'
            ]);

            $user = User::where(['email' => $token_exist->email, 'status' => 1])->first();

            if(!empty($user)) {
                $user->password =  Hash::make($request->password);
                $user->save();

                PasswordResetToken::where(['token' => $token])->delete();

                return redirect()->route('login')->with('success', 'Password Reset Successfully. Login With New Password');
            }

            return back()->with('error', 'Password Not Reset. Please Try Again');
        }
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('auth::index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('auth::create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): RedirectResponse
    {
        //
    }

    /**
     * Show the specified resource.
     */
    public function show($id)
    {
        return view('auth::show');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        return view('auth::edit');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id): RedirectResponse
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        //
    }
}
