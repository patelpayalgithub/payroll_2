    @extends('layout.admin_default_layout')
    @section('content')
        <div class="container-xxl flex-grow-1 container-p-y">
            <div class="jsFlashMessage">
                @include('flashmessage.flashmessage')
            </div>
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center">
                <h4 class="py-lg-3 mb-lg-4"><span class="text-muted fw-light">Dashboard /</span> Attendance Correction</h4>
                <div class="d-flex align-content-center flex-wrap gap-3 mb-3 mb-lg-0">
                    <div class="d-flex gap-3">
                        <a href="{{ route('attendancecorrection.import') }}" class="btn btn-outline-success"><i class="fas fa-upload"></i>&nbsp;&nbsp;Import</a>
                    </div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col">
                    <div class="accordion" id="collapsibleSection">
                        <div class="card accordion-item">
                            <h2 class="accordion-header" id="headingDeliveryAddress">
                                <button type="button" class="accordion-button" data-bs-toggle="collapse" data-bs-target="#collapseDeliveryAddress" aria-expanded="true" aria-controls="collapseDeliveryAddress">
                                    Searching...
                                </button>
                            </h2>
                            <div id="collapseDeliveryAddress" class="accordion-collapse collapse" data-bs-parent="#collapsibleSection">
                                <div class="accordion-body">
                                    <div class="row g-3">
                                        <div class="col-md-3">
                                            <label class="form-label" for="collapsible-phone">Employee Id</label>
                                            <input type="text" class="form-control phone-mask jsEmployeeId"/>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label" for="collapsible-fullname">Name</label>
                                            <input type="text" name="full_name" class="form-control jsName"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-datatable text-nowrap">
                    <table class="data-table table text-center table-responsive text-nowrap" id="AttendanceCorrection">
                        <thead>
                            <tr>
                                <th class="text-center">Employee Name</th>
                                <th class="text-center">Employee Id</th>
                                <th class="text-center">Attendence Correction</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    @endsection

    @push('script')
        <script type="text/javascript">
            var table_id = $("#AttendanceCorrection");

            $(function () {
                window.table = $('.data-table').DataTable({
                    processing: true,
                    serverSide: true,
                    searching: false,
                    order: [],
                    ajax: {
                        url:"{{ route('attendancecorrection.index') }}",
                        data: function (d) {
                            d.emp_id = $('.jsEmployeeId').val(),
                            d.full_name = $('.jsName').val(),
                            d.email = $('.jsEmail').val(),
                            d.mobile_no = $('.jsMobileNo').val()
                        }
                    },
                    columns: [
                        { data: 'full_name', name: 'full_name' },
                        { data: 'emp_id', name: 'emp_id' },
                        { data: 'correction', name: 'correction', orderable: false, searchable: false },
                    ],
                });
        
                $(".form-control").keyup(function(){
                    table.draw();
                });
            });
        </script>
    @endpush
