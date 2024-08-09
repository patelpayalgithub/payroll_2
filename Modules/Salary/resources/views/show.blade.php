    @extends('layout.admin_default_layout')
    @section('content')
        <div class="container-xxl flex-grow-1 container-p-y">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center">
                <h4 class="py-3 mb-4">
                    <span class="text-muted fw-light">
                        <a href="{{ route('dashboard') }}" class="text-reset">Dashboard</a> / 
                        <a href="{{ route('salary.employeesalary') }}" class="text-reset">Salary</a> / 
                    </span> Show
                </h4>
            </div>
            <div class="col-xl justify-content-center d-flex">
                <div class="card mb-4 w-px-500">
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-center">
                            <div class="col-mb-3">
                                <label class="form-label" for="basic-default-fullname">Select Month & Year <span class="text-danger">*</span></label>
                                <input type="month" name="month_year" class="form-control jsMonthYear" max="{{ date('Y-m') }}" data-rule-required="true" data-msg-required="Please Select Month & Year" value="{{ $salary->month_year }}" readonly/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xxl">
                    <div class="card mb-4">
                        <div class="card-header d-flex align-items-center justify-content-between">
                            <h5 class="mb-0">Employee Detail</h5>
                            <small class="text-muted float-end d-none">Default label</small>
                        </div>
                        <div class="card-body">
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-name">Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" value="{{ $salary->user->full_name }}" readonly/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-email">Email</label>
                                <div class="col-sm-10">
                                    <div class="input-group input-group-merge">
                                        <input type="text" class="form-control" value="{{ $salary->user->email }}" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-phone">Phone No</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" value="{{ $salary->user->mobile_no }}" readonly/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-phone">Role</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" value="{{ $salary->user->getRoleNames()->first() }}" readonly/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xxl">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between">
                            <h5 class="card-title m-0 me-2">Leave Balance</h5>
                            <div class="dropdown d-none">
                                <button class="btn p-0" type="button" id="teamMemberList" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="ti ti-dots-vertical ti-sm text-muted"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="teamMemberList">
                                    <a class="dropdown-item" href="javascript:void(0);">Download</a>
                                    <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                                    <a class="dropdown-item" href="javascript:void(0);">Share</a>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-borderless border-top">
                                <thead class="border-bottom">
                                    <tr>
                                        <th></th>
                                        <th>Leave Type</th>
                                        <th>Assign Leave</th>
                                        <th>Leave Balance</th>
                                    </tr>
                                </thead>
                                <tbody class="border-bottom">
                                    @php
                                        $remainingLeave = 0;
                                    @endphp
                                    @foreach($salary->user->assign_leave as $alkey => $alvalue)
                                        <tr>
                                            <td>{{ $alkey + 1 }})</td>
                                            <td>{{ $alvalue->leave->leave_type_name }}</td>
                                            <td>{{ $alvalue->assign_leave }}</td>
                                            <td>{{ $alvalue->leave_balance }}</td>
                                        </tr>
                                        @php 
                                            $remainingLeave += $alvalue->leave_balance; 
                                        @endphp
                                    @endforeach
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td><strong> Remaining Leave</strong></td>
                                        <td>{{ $remainingLeave }}</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xxl">
                <div class="card mb-2">
                    <div class="card-header d-flex justify-content-between">
                        <h5 class="card-title m-0 me-2">Calculate Days</h5>
                        <div class="dropdown d-none">
                            <button class="btn p-0" type="button" id="teamMemberList" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="ti ti-dots-vertical ti-sm text-muted"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="teamMemberList">
                                <a class="dropdown-item" href="javascript:void(0);">View Salary Structure</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label for="present-days" class="form-label">Present Days <span class="text-danger">*</span></label>
                                <input type="number" name="present_days" class="form-control jsPresentDays" readonly data-rule-required="true" data-msg-required="Please Enter Present Days" value="{{ $salary->present_days }}"/>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="total-week-off" class="form-label">Total Week Off <span class="text-danger">*</span></label>
                                <input type="number" name="total_week_off" class="form-control jsTotalWeekOffs" readonly data-rule-required="true" data-msg-required="Please Enter Total Week Off" value="{{ $salary->total_week_off }}"/>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="paid_holiday" class="form-label">Paid Holiday <span class="text-danger">*</span></label>
                                <input type="number" name="paid_holiday" class="form-control jsPaidHoliday" readonly data-rule-required="true" data-msg-required="Please Enter Paid HoliDay" value="{{ $salary->paid_holiday }}"/>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="number-of-paid-leaves" class="form-label">Number of Paid Leaves <span class="text-danger">*</span></label>
                                <input type="number" name="number_of_paid_leaves" class="form-control jsNumberofPaidLeaves" min="0" value="{{ $salary->number_of_paid_leaves }}" readonly/>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="absent-day's" class="form-label">Absent Day's <span class="text-danger">*</span></label>
                                <input type="number" name="absent_days" class="form-control jsAbsentDay" readonly min=0 data-rule-required="true" data-msg-required="Please Enter Absent Day's" value="{{ $salary->absent_days }}"/>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="total-day" class="form-label">Total Day's <span class="text-danger">*</span></label>
                                <input type="number" name="total_days" class="form-control jsTotalDays" readonly min=0 data-rule-required="true" data-msg-required="Please Enter Total Day's" value="{{ $salary->total_days }}"/>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="number-of-days-worked" class="form-label">Number of Days Work <span class="text-danger">*</span></label>
                                <input type="number" name="number_of_days_work" class="form-control jsNumberOfDayWork" readonly data-rule-required="true" data-msg-required="Please Enter Number of Days Work" value="{{ $salary->number_of_days_work }}"/>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="overtime-hr-worked" class="form-label">Per Day Salary <span class="text-danger">*</span></label>
                                <input type="text" name="per_day_salary" class="form-control jsPerDaySalary" readonly data-rule-required="true" data-msg-required="Please Enter Per Day Salary" value="{{ $salary->per_day_salary }}"/>
                            </div>
                            {{-- <div class="col-md-4 mb-3">
                                <label for="overtime-hour-worked" class="form-label">Overtime Work (in Hr.) <span class="text-danger">*</span></label><br>
                                <input type="text" name="overtime_work_hr" class="form-control jsTimeMask jsOTHour" data-rule-required="true" data-msg-required="Please Enter Overtime Work (in Hr.)"/>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="rs-per-hout" class="form-label">Rs. Per Hour (Overtime Hr.) <span class="text-danger">*</span></label>
                                <input type="number" name="ot_per_hr_rs" class="form-control" data-rule-required="true" data-msg-required="Please Enter Rs. Per Hour (Overtime Hr.)"/>
                            </div> --}}
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Salary Structure</th>
                                    <th>Monthly Calculation As Per Appoitment Letter</th>
                                    <th>Monthly Calculation As Per Current Month</th>
                                </tr>
                            </thead>
                            <tbody class="table-border-bottom-0">
                                <tr>
                                    <td>
                                        <p>Basic</p>
                                    </td>
                                    <td>
                                        <input type="number" class="form-control jsCalculateGrossSalaryMonthly" data-rule-required="true" data-msg-required="Please Enter Basic" value="{{ $salary->user->user_detail->basic_monthly }}" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="basic" class="form-control jsBasic" data-rule-required="true" data-msg-required="Please Enter Basic" value="{{ $salary->basic }}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>HRA</p>
                                    </td>
                                    <td>
                                        <input type="number" class="form-control jsCalculateGrossSalaryMonthly" data-rule-required="true" data-msg-required="Please Enter HRA" value="{{ $salary->user->user_detail->hra_monthly }}" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="hra" class="form-control jsHra" data-rule-required="true" data-msg-required="Please Enter HRA" value="{{ $salary->hra }}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>Medical</p>
                                    </td>                                        
                                    <td>
                                        <input type="number" class="form-control jsCalculateGrossSalaryMonthly" data-rule-required="true" data-msg-required="Please Enter Medical" value="{{ $salary->user->user_detail->medical_monthly }}" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="medical" class="form-control jsMedical" data-rule-required="true" data-msg-required="Please Enter Medical" value="{{ $salary->medical }}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>Education</p>
                                    </td>
                                    <td>
                                        <input type="number" class="form-control jsCalculateGrossSalaryMonthly" data-rule-required="true" data-msg-required="Please Enter Education" value="{{ $salary->user->user_detail->education_monthly }}" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="education" class="form-control jsEducation" data-rule-required="true" data-msg-required="Please Enter Education" value="{{ $salary->education }}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>Conveyance</p>
                                    </td>
                                    <td>
                                        <input type="number" name="conveyance_monthly" class="form-control jsCalculateGrossSalaryMonthly" data-rule-required="true" data-msg-required="Please Enter Conveyance" value="{{ $salary->user->user_detail->conveyance_monthly }}" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="conveyance" class="form-control jsConveyance" data-rule-required="true" data-msg-required="Please Enter Conveyance" value="{{ $salary->conveyance }}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>Special Allowance</p>
                                    </td>
                                    <td>
                                        <input type="number" name="special_allowance_monthly" class="form-control jsCalculateGrossSalaryMonthly" data-rule-required="true" data-msg-required="Please Enter Special Allowance" value="{{ $salary->user->user_detail->special_allowance_monthly }}" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="special_allowance" class="form-control jsSplAllowance" data-rule-required="true" data-msg-required="Please Enter Special Allowance" value="{{ $salary->special_allowance }}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>Gross Salary (A)</strong>
                                    </td>
                                    <td>
                                        <span class="jsGrossSalaryMonthlyA">{{ config("constant.currency_symbol").' '.$salary->user->user_detail->gross_salary_A_monthly }}</span>
                                    </td>
                                    <td>
                                        <span class="jsGrossSalaryA">{{ config('constant.currency_symbol').' '.$salary->gross_salary_A }}</span>
                                        <input type="hidden" class="jsInputGrossSalaryA" value="{{ $salary->gross_salary_A }}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>Less : Deduction</strong></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><strong>Do you want to Deduct PF</strong></td>
                                    <td>
                                        <select name="is_pf_deduct_monthly" class="form-select jsIsPFDeductMonthly" disabled>
                                            <option value="">Select Deduct PF</option>
                                            <option value="Yes" @if($salary->user->user_detail->is_pf_deduct_monthly == 'Yes') selected @endif>Yes</option>
                                            <option value="No" @if($salary->user->user_detail->is_pf_deduct_monthly == 'No') selected @endif>Not Deduct</option>
                                            <option value="Fix" @if($salary->user->user_detail->is_pf_deduct_monthly == 'Fix') selected @endif>Fix Deduct</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-select jsIsPFDeductCurrentMonth" disabled>
                                            <option value="">Select Deduct PF</option>
                                            <option value="Yes" @if($salary->is_pf_deduct == 'Yes') selected @endif>Yes</option>
                                            <option value="No" @if($salary->is_pf_deduct == 'No') selected @endif>Not Deduct</option>
                                            <option value="Fix" @if($salary->is_pf_deduct == 'Fix') selected @endif>Fix Deduct</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Employee Contribution 12% of basic of Rs. 1800/- whichever is less</td>
                                    <td>
                                        <input type="number" class="form-control jsEmployeeContributionMonthly" value="{{ $salary->user->user_detail->employee_contribution_monthly }}" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="employee_contribution" class="form-control jsEmployeeContribution" value="{{ $salary->employee_contribution }}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>ESI Employee Contribution (0.25%)</td>
                                    <td>
                                        <input type="number" class="form-control jsESIEmployeeContributionMonthly" data-rule-required="true" data-msg-required="Please Enter ESI Employee Contribution" value="{{ $salary->user->user_detail->esi_employee_contribution_monthly }}" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="esi_employee_contribution" class="form-control jsESIEmployeeContribution" data-rule-required="true" data-msg-required="Please Enter ESI Employee Contribution" value="{{ $salary->esi_employee_contribution }}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Labour Welfare Fund (Gujarat) employee Contribution</td>
                                    <td>
                                        <input type="number" class="form-control jsLabourEmployeeContriMonthly" data-rule-required="true" data-msg-required="Please Enter Labour Welfare Fund" value="{{ $salary->user->user_detail->labour_welfare_employee_monthly }}" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="labour_welfare_employee" class="form-control jsLabourEmployeeContriCurrentMonth" data-rule-required="true" data-msg-required="Please Enter Labour Welfare Fund" value="{{ $salary->labour_welfare_employee }}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Professional Tax</td>
                                    <td>
                                        <input type="number" class="form-control jsProfessionalTaxMonthly" data-rule-required="true" data-msg-required="Please Enter Professional Tax" value="{{ $salary->user->user_detail->professional_tax_monthly }}" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="professional_tax" class="form-control jsProfessionalTaxCurrentMonth" data-rule-required="true" data-msg-required="Please Enter Professional Tax" value="{{ $salary->professional_tax }}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>Employee Contribution (B)</strong></td>
                                    <td>
                                        <span class="jsEmployeeContributionBMonthly">{{ config("constant.currency_symbol").' '.$salary->user->user_detail->employee_contribution_B_monthly }}</span>
                                    </td>
                                    <td>
                                        <span class="jsEmployeeContributionBCurrentMonthly">{{ config('constant.currency_symbol').' '.$salary->employee_contri_B }}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>Net Salary (C)</strong></td>
                                    <td>
                                        <span class="jsNetSalaryCMonthly">{{ config("constant.currency_symbol").' '.$salary->user->user_detail->net_salary_C_monthly }}</span>
                                    </td>
                                    <td>
                                        <span class="jsNetSalaryC">{{ config('constant.currency_symbol').' '.$salary->net_salary_C }}</span>
                                    </td>
                                </tr>
                                {{-- <tr>
                                    <td>P.F. (Employers Controbution 12% of Basic or Rs. 1800/- which ever is less)</td>
                                    <td>
                                        <input type="number" name="employer_contribution_monthly" class="form-control jsEmployerContriMonthly" value="{{ $salary->user->user_detail->employer_contribution_monthly }}" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="employer_contribution" class="form-control jsEmployerContriCurrentMonth" value="{{ $salary->employer_contribution }}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>ESI Employer Contribution</td>
                                    <td>
                                        <input type="number" name="esi_employer_contribution_monthly" class="form-control jsESIEmployerContributionMonthly" value="{{ $salary->user->user_detail->esi_employer_contribution_monthly }}" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="esi_employer_contribution" class="form-control jsESIEmployerContributionCurrentMonth" value="{{ $salary->esi_employer_contribution }}" readonly>
                                    </td>
                                </tr> --}}
                                <tr>
                                    <td>Labour Welfare Fund (Gujarat) Employer Contribution</td>
                                    <td>
                                        <input type="number" class="form-control jsLabourEmployerContriMonthly"value="{{ $salary->user->user_detail->labour_welfare_employer_monthly }}" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="labour_welfare_employer" class="form-control jsLabourEmployerContri" value="{{ $salary->labour_welfare_employer }}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Employer Contribution (D)</td>
                                    <td>
                                        <span class="jsEmployerContributionDMonthly">{{ config("constant.currency_symbol").' '.$salary->user->user_detail->employer_contri_D_monthly }}</span>
                                    </td>
                                    <td>
                                        <span class="jsEmployerContributionD">{{ config('constant.currency_symbol').' '.$salary->employee_contri_D }}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>CTC (B+C+D)</td>
                                    <td>
                                        <span class="jsCTCBCDMonthly">{{ config("constant.currency_symbol").' '.$salary->user->user_detail->ctc_bcd_monthly }}</span>
                                    </td>
                                    <td>
                                        <span class="jsCTCBCD">{{ config('constant.currency_symbol').' '.$salary->ctc_BCD }}</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label for="final-amount" class="form-label">Final Amount <span class="text-danger">*</span></label>
                                <input type="number" name="final_amount" class="form-control jsFinalAmount" readonly value="{{ $salary->final_amount }}"/>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="mode-of-payment" class="form-label">Mode Of Payment <span class="text-danger">*</span></label>
                                <select name="payment_mode" class="form-select" data-rule-required="true" data-msg-required="Please Select Mode of Payment" disabled>
                                    <option value="">Select Mode Of Payment</option>
                                    @foreach(config('constant.payment_mode') as $pkey => $pvalue)
                                        <option value="{{ $pkey }}" @if($salary->payment_mode == $pkey) selected @endif>{{ $pvalue }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="remark" class="form-label">Remark</label>
                                <textarea name="remark" class="form-control" readonly>{{ $salary->remark }}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="pt-4 mb-4 justify-content-center d-flex">
                        <a href="{{ route('salary.employeesalary') }}" class="btn btn-label-secondary waves-effect">Back</a>
                    </div>
                </div>
            </div>
        </div>
    @endsection
    @push('script')
        <script src="{{ asset('admin/assets/js/app-date-time-mask.js') }}"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("#sss").unbind("keydown").keydown(function (e) {
                    var thisk = e.keyCode || e.which;
                    console.log(e.keyCode)
                });
                $("#date1").typeADate();
                $(".jsTimeMask").typeATime();

            });
        </script>

        <script type="text/javascript">
            $(document).ready(function() {
                function calculateDaysInMonth(year, month) {
                    // Month is 0-indexed in JavaScript Date object (0 = January, 1 = February, etc.)
                    return new Date(year, month + 1, 0).getDate();
                }

                function updateDaysInMonth() {
                    var value = $('.jsMonthYear').val();
                    if (value) {
                        var [year, month] = value.split('-').map(Number);
                        // JavaScript Date object expects month to be 0-indexed
                        var days = calculateDaysInMonth(year, month - 1);
                        $('.jsTotalDays').val(days);

                        calculateAllDaysWithSalary();
                    }
                }

                // Update days when month/year input changes
                $('.jsMonthYear').on('change', updateDaysInMonth);
                
                function calculateAllDaysWithSalary()
                {
                    $.ajax({
                        url: "{{ route('salary.calculateAllDaysWithSalary') }}",
                        type: 'POST',
                        dataType:'json',
                        data:{
                            monthYear: $('.jsMonthYear').val(),
                            userId: '{{ $salary->user_id }}',
                            "_token": "{{ csrf_token() }}"
                        },
                        success:function(response){
                            if(response.status === true)
                            {
                                $('.jsPresentDays').val(response.data.presentDays);
                                $('.jsTotalWeekOffs').val(response.data.totalWeekOff);
                                $('.jsPaidHoliday').val(response.data.paidHoliday);
                                $('.jsAbsentDay').val(response.data.absentDays);
                                $('.jsNumberOfDayWork').val(response.data.numberOfWorkDay);
                                $('.jsPerDaySalary').val(response.data.perDaySalary);
                                $('.jsBasic').val(response.data.Basic);
                                $('.jsHra').val(response.data.Hra);
                                $('.jsMedical').val(response.data.Medical);
                                $('.jsEducation').val(response.data.Education);
                                $('.jsConveyance').val(response.data.Conveyance);
                                $('.jsSplAllowance').val(response.data.SplAllowance);
                                $('.jsGrossSalaryA').text('{{ config("constant.currency_symbol") }}'+' '+response.data.GrossSalaryA);
                                $('.jsInputGrossSalaryA').val(response.data.GrossSalaryA);
                                $('.jsEmployeeContribution').val(response.data.EmployeeContribution);
                                $('.jsESIEmployeeContribution').val(response.data.ESIEmployeeContribution);
                                $('.jsLabourEmployeeContriCurrentMonth').val(response.data.LabourEmployeeContriCurrentMonth);
                                $('.jsProfessionalTaxCurrentMonth').val(response.data.ProfessionalTax);
                                $('.jsEmployeeContributionBCurrentMonthly').text('{{ config("constant.currency_symbol") }}'+' '+response.data.EmployeeContributionB);                                
                                $('.jsNetSalaryC').text('{{ config("constant.currency_symbol") }}'+' '+response.data.NetSalaryC);
                                $('.jsLabourEmployerContri').val(response.data.LabourEmployerContri);
                                $('.jsEmployerContributionD').text('{{ config("constant.currency_symbol") }}'+' '+response.data.EmployerContributionD);
                                $('.jsCTCBCD').text('{{ config("constant.currency_symbol") }}'+' '+response.data.Ctcbcd);
                                $('.jsFinalAmount').val(response.data.Ctcbcd);
                            }
                        }
                    })
                }
            });

            $(document).on('keyup change', '.jsNumberofPaidLeaves', calculateSalary);
            
            let previousPaidLeaves = "{{ $salary->number_of_paid_leaves }}";
            
            function calculateSalary() {
                let currentPaidLeaves = parseFloat($(this).val()) || 0;
                let numberOfDaysWork = parseFloat($('.jsNumberOfDayWork').val()) || 0;
                let totalDays = parseFloat($('.jsTotalDays').val());

                let changeInPaidLeaves = currentPaidLeaves - previousPaidLeaves;

                // Update number of days worked
                numberOfDaysWork += changeInPaidLeaves;

                // Update the value of number of days worked
                $('.jsNumberOfDayWork').val(numberOfDaysWork);

                // Update previous paid leaves to the current value
                previousPaidLeaves = currentPaidLeaves;
                
                var Basic = (numberOfDaysWork * parseFloat('{{ $salary->user->user_detail->basic_monthly }}')) / totalDays;
                    Hra = (numberOfDaysWork * parseFloat('{{ $salary->user->user_detail->hra_monthly }}')) / totalDays;
                    Medical = (numberOfDaysWork * parseFloat('{{ $salary->user->user_detail->medical_monthly }}')) / totalDays;
                    Education = (numberOfDaysWork * parseFloat('{{ $salary->user->user_detail->education_monthly }}')) / totalDays;
                    Conveyance = (numberOfDaysWork * parseFloat('{{ $salary->user->user_detail->conveyance_monthly }}')) / totalDays;
                    SplAllowance = (numberOfDaysWork * parseFloat('{{ $salary->user->user_detail->special_allowance_monthly }}')) / totalDays;

                    GrossSalaryA = Basic + Hra + Medical + Education + Conveyance + SplAllowance;
                    
                    pfDeductionStatus = "{{ $salary->user->user_detail->is_pf_deduct_monthly }}";
                    LabourWelfareFund = parseFloat("{{ $salary->user->user_detail->labour_welfare_employee_monthly }}");
                    ProfessionalTaxCurrentMonth = parseFloat("{{ $salary->user->user_detail->professional_tax_monthly }}");

                    switch (pfDeductionStatus) {
                        case 'Yes':
                            EmployeeContriCurrentMonth = (Basic * 12) / 100;
                            break;
                        case 'No':
                            EmployeeContriCurrentMonth = 0;
                            break;
                        case 'Fix':
                            EmployeeContriCurrentMonth = parseFloat("{{ $salary->user->user_detail->employee_contribution_monthly }}");
                        default:
                            EmployeeContriCurrentMonth = 0;
                            break;
                    }

                    EmployeeContriBCurrentMonth = EmployeeContriCurrentMonth + LabourWelfareFund + ProfessionalTaxCurrentMonth;
                    
                    NetSalaryC = GrossSalaryA - (EmployeeContriCurrentMonth + LabourWelfareFund + ProfessionalTaxCurrentMonth);

                    Ctcbcd = EmployeeContriBCurrentMonth + NetSalaryC + parseFloat("{{ $salary->user->user_detail->employer_contri_D_monthly }}");

                $('.jsBasic').val(Basic.toFixed(2));
                $('.jsHra').val(Hra.toFixed(2));
                $('.jsMedical').val(Medical.toFixed(2));
                $('.jsEducation').val(Education.toFixed(2));
                $('.jsConveyance').val(Conveyance.toFixed(2));
                $('.jsSplAllowance').val(SplAllowance.toFixed(2));
                $('.jsGrossSalaryA').text('{{ config("constant.currency_symbol") }}'+' '+Math.round(GrossSalaryA).toFixed(2));
                $('.jsInputGrossSalaryA').val(Math.round(GrossSalaryA).toFixed(2));
                $('.jsEmployeeContribution').val(Math.round(EmployeeContriCurrentMonth).toFixed(2));
                $('.jsEmployeeContributionBCurrentMonthly').text('{{ config("constant.currency_symbol") }}'+' '+Math.round(EmployeeContriBCurrentMonth).toFixed(2));
                $('.jsNetSalaryC').text('{{ config("constant.currency_symbol") }}'+' '+Math.round(NetSalaryC).toFixed(2));
                $('.jsCTCBCD').text('{{ config("constant.currency_symbol") }}'+' '+Math.round(Ctcbcd).toFixed(2))
                $('.jsInputCTCBCD').val(Math.round(Ctcbcd).toFixed(2));
                $('.jsFinalAmount').val(Math.round(Ctcbcd).toFixed(2));
            }

            $('.FormValidate').validate();
        </script>
    @endpush