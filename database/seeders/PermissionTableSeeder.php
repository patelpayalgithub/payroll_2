<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Reset cached roles and permissions
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // Disable foreign key checks
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');

        // Truncate the permissions table
        DB::table('permissions')->truncate();

        // Enable foreign key checks
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');

        $permissions = [
            [
                'name' => 'view-role',
                'group_name' => 'Role'
            ],
            [
                'name' => 'create-role',
                'group_name' => 'Role'
            ],
            [
                'name' => 'edit-role',
                'group_name' => 'Role'
            ],
            [
                'name' => 'delete-role',
                'group_name' => 'Role'
            ],
            [
                'name' => 'view-employee',
                'group_name' => 'Employee'
            ],
            [
                'name' => 'create-employee',
                'group_name' => 'Employee'
            ],
            [
                'name' => 'edit-employee',
                'group_name' => 'Employee'
            ],
            [
                'name' => 'delete-employee',
                'group_name' => 'Employee'
            ],
            [
                'name' => 'leave-history',
                'group_name' => 'Employee'
            ],
            [
                'name' => 'delete-letters',
                'group_name' => 'Employee'
            ],
            [
                'name' => 'view-designation',
                'group_name' => 'Designation'
            ],
            [
                'name' => 'create-designation',
                'group_name' => 'Designation'
            ],
            [
                'name' => 'edit-designation',
                'group_name' => 'Designation'
            ],
            [
                'name' => 'delete-designation',
                'group_name' => 'Designation'
            ],
            [
                'name' => 'view-department',
                'group_name' => 'Department'
            ],
            [
                'name' => 'create-department',
                'group_name' => 'Department'
            ],
            [
                'name' => 'edit-department',
                'group_name' => 'Department'
            ],
            [
                'name' => 'delete-department',
                'group_name' => 'Department'
            ],
            [
                'name' => 'view-leave',
                'group_name' => 'Leave'
            ],
            [
                'name' => 'create-leave',
                'group_name' => 'Leave'
            ],
            [
                'name' => 'edit-leave',
                'group_name' => 'Leave'
            ],
            [
                'name' => 'delete-leave',
                'group_name' => 'Leave'
            ],
            [
                'name' => 'view-holiday-leave',
                'group_name' => 'HolidayLeave'
            ],
            [
                'name' => 'create-holiday-leave',
                'group_name' => 'HolidayLeave'
            ],
            [
                'name' => 'edit-holiday-leave',
                'group_name' => 'HolidayLeave'
            ],
            [
                'name' => 'delete-holiday-leave',
                'group_name' => 'HolidayLeave'
            ],
            [
                'name' => 'view-previous-leave',
                'group_name' => 'HolidayLeave'
            ],
            [
                'name' => 'view-leave-apply',
                'group_name' => 'LeaveApply'
            ],
            [
                'name' => 'create-leave-apply',
                'group_name' => 'LeaveApply'
            ],
            [
                'name' => 'edit-leave-apply',
                'group_name' => 'LeaveApply'
            ],
            [
                'name' => 'delete-leave-apply',
                'group_name' => 'LeaveApply'
            ],
            [
                'name' => 'view-location',
                'group_name' => 'PunchInOut'
            ],
            [
                'name' => 'employee-list-attendance-correction',
                'group_name' => 'AttendanceCorrection'
            ],
            [
                'name' => 'attendance-list-attendancecorrection',
                'group_name' => 'AttendanceCorrection'
            ],
            [
                'name' => 'edit-attendance-correction',
                'group_name' => 'AttendanceCorrection'
            ],
            [
                'name' => 'employee-list-attendancereport',
                'group_name' => 'AttendanceReport'
            ],
            [
                'name' => 'attendance-report',
                'group_name' => 'AttendanceReport'
            ],
            [
                'name' => 'view-salary',
                'group_name' => 'Salary'
            ],
            [
                'name' => 'create-salary',
                'group_name' => 'Salary'
            ],
            [
                'name' => 'edit-salary',
                'group_name' => 'Salary'
            ],
            [
                'name' => 'show-salary',
                'group_name' => 'Salary'
            ],
            [
                'name' => 'view-leave-hr',
                'group_name' => 'Leave Approval By HR'
            ],
            [
                'name' => 'edit-leave-hr',
                'group_name' => 'Leave Approval By HR'
            ],
            [
                'name' => 'delete-leave-hr',
                'group_name' => 'Leave Approval By HR'
            ],
            [
                'name' => 'view-leave-pm',
                'group_name' => 'Leave Approval By Project Manager'
            ],
            [
                'name' => 'edit-leave-pm',
                'group_name' => 'Leave Approval By Project Manager'
            ],
            /* [
                'name' => 'view-project',
                'group_name' => 'Project'
            ],
            [
                'name' => 'create-project',
                'group_name' => 'Project'
            ],
            [
                'name' => 'edit-project',
                'group_name' => 'Project'
            ],
            [
                'name' => 'delete-project',
                'group_name' => 'Project'
            ],
            [
                'name' => 'show-deleted-project',
                'group_name' => 'Project'
            ],
            [
                'name' => 'restore-deleted-project',
                'group_name' => 'Project'
            ], */
            [
                'name' => 'edit-setting',
                'group_name' => 'Setting'
            ],
        ];

        foreach ($permissions as $permission) {
            Permission::create($permission);
        }

        // Assign permissions to roles
        $role = Role::findByName('Admin');
        $role->givePermissionTo(Permission::all());
    }
}
