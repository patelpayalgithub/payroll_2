    @extends('layout.admin_default_layout')
    @section('content')
        <div class="container-xxl flex-grow-1 container-p-y">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center">
                <h4 class="py-3 mb-4">
                    <span class="text-muted fw-light">
                        <a href="{{ route('dashboard') }}" class="text-reset">Dashboard</a> / 
                        <a href="{{ route('project.index') }}" class="text-reset">Project</a>
                    </span> / Add
                </h4>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card mb-3">
                        <div class="card-header pt-2">
                            <ul class="nav nav-tabs card-header-tabs" role="tablist">
                                <li class="nav-item">
                                    <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#form-tabs-personal" role="tab" aria-selected="true">
                                        General
                                    </button>
                                </li>
                                <li class="nav-item">
                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#clientdetail" role="tab" aria-selected="false">
                                        Client Detail
                                    </button>
                                </li>
                                <li class="nav-item">
                                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#maketeam" role="tab" aria-selected="false">
                                        Make Team
                                    </button>
                                </li>
                            </ul>
                        </div>

                        <form action="{{ route('project.store') }}" class="jsFormValidate" method="post" autocomplete="off">
                            @csrf
                            <div class="tab-content">
                                <div class="tab-pane fade active show" id="form-tabs-personal" role="tabpanel">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label" for="project-name">Project Name <span class="text-danger">*</span></label>
                                            <input type="text" name="project_name" class="form-control" data-rule-required="true" data-msg-required="Please Enter Project Name"/>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label" for="start-date">Start Date</label>
                                            <input type="date" name="start_date" class="form-control" />
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label" for="expected-end-date">Expected End Date</label>
                                            <input type="date" name="expected_end_date" class="form-control"/>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label" for="project-domain-name">Project Domain Name</label>
                                            <input type="text" name="project_domain_name" class="form-control">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label" for="project-running-status">Project Running Status <span class="text-danger">*</span></label>
                                            <select name="running_status" class="form-select" data-rule-required="true" data-msg-required="Please Select Project Running Status">
                                                <option value="">Select Running Status</option>
                                                <option value="1">Pending</option>
                                                <option value="2">Intermediate</option>
                                                <option value="3">Complete</option>
                                                <option value="4">Hold</option>
                                                <option value="5">Not Started</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label" for="project-domain-name">Git Repository with Final Branch link</label>
                                            <input type="text" name="git_repository_link" class="form-control">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label" for="project-domain-name">Project Backup link on Office Server</label>
                                            <input type="text" name="project_backup_link_office_server" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="clientdetail" role="tabpanel">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="client-name" class="form-label">Client Name</label>
                                            <input type="text" name="client_name" class="form-control">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="client-email" class="form-label">Client Email</label>
                                            <input type="text" name="email" class="form-control">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="mobile-no" class="form-label">Client Mobile Number</label>
                                            <input type="text" name="mobile_no" class="form-control">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="client-name" class="form-label">Client Address</label>
                                            <textarea name="address" class="form-control"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="maketeam" role="tabpanel">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive text-nowrap">
                                                <table class="table" id="jsTeamTable">
                                                    <thead>
                                                        <tr>
                                                            <th>Designation</th>
                                                            <th>Employee Name</th>
                                                            <th class="text-center">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="table-border-bottom-0">
                                                        <tr class="jsBtnRow">
                                                            <td></td>
                                                            <td></td>
                                                            <td class="text-center">
                                                                <a href="javascript:void(0);" class="btn btn-outline-success" onclick="addRow()"><i class="fas fa-plus"></i></a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="pt-4">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <a href="{{ route('project.index') }}" class="btn btn-label-secondary waves-effect">Back</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    @endsection

    @push('script')
        <script type="text/javascript">
            var teamrowno = 0;
            function addRow()
            {
                html = `<tr id="teamrow`+ teamrowno +`">
                            <td>
                                <select name="project_team[`+ teamrowno +`][designation_id]" class="form-select jsSelectedDesignation" data-rule-required="true" data-msg-required="Please Select Designation">
                                    <option value="">Select Desigantion</option>
                                    @foreach($designationList as $key => $value)
                                        <option value="{{ $key }}">{{ $value }}</option>
                                    @endforeach
                                </select>
                            </td>
                            <td>
                                <select name="project_team[`+ teamrowno +`][user_id]" class="form-select jsEmployeeSelect" data-rule-required="true" data-msg-required="Please Select Employee">
                                    <option value="">Select Employee</option>
                                </select>
                            </td>
                            <td class="text-center">
                                <a href="javascript:void(0);" class="btn btn-outline-danger" onclick="$(\'#teamrow` + teamrowno  + `\').remove();"><i class="fas fa-trash"></i></a>
                            </td>
                        </tr>`;

                $('#jsTeamTable tbody .jsBtnRow').before(html);

                teamrowno++;
            }

            $('.jsFormValidate').validate({
                ignore: "",
                highlight: function(element) {
                    $(element).removeClass('label .error');
                },
                submitHandler: function(form) {
                    $(form).find(':submit').prop('disabled', true);
                    $(form).find(':submit').text('Please Wait');
                    form.submit();
                }
            });

            $('#jsTeamTable').on('change', '.jsSelectedDesignation', function(){
                var selectedDesignation = $(this).val();
                    tr = $(this).closest('tr');
                    // employeeSelect = tr.find('.jsEmployeeSelect');
                    token = "{{ csrf_token() }}";
                
                $.ajax({
                    url: '{{ route("project.getEmployeeList") }}',
                    type: 'POST',
                    data: {
                        '_token': "{{ csrf_token() }}",
                        designation_id: selectedDesignation 
                    },
                    success: function(response) {
                        var employeeSelect = tr.find('select[name*="[user_id]"]');
                        employeeSelect.empty(); // Clear existing options
                        
                        // Populate the employee dropdown with new options
                        employeeSelect.append('<option value="">Select Employee</option>');
                        $.each(response, function(key, value) {
                            employeeSelect.append('<option value="'+ key +'">'+ value +'</option>');
                        });
                    },
                    error: function(xhr, status, error) {
                        console.error(error);
                    }
                })
            })
        </script>
    @endpush