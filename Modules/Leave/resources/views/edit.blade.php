    @extends('layout.admin_default_layout')
    @section('content')
        <div class="container-xxl flex-grow-1 container-p-y">
            <div class="jsFlashMessage">
                @include('flashmessage.flashmessage')
            </div>
            <h4 class="py-3 mb-4"><span class="text-muted fw-light">Dashboard /</span> Leave</h4>
            
            <div class="row">
                <div class="col-xl">
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="mb-0">Leave Type Edit</h5>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('leave.update', $model->id) }}" method="post">
                                @csrf
                                @method('put')
                                <div class="mb-3">
                                    <label class="form-label" for="leave-type-name">Leave Type Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="leave_type_name" value="{{ old('leave_type_name', $model->leave_type_name) }}"/>
                                    <span class="error">{{ $errors->first('leave_type_name') }}</span>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="number-of-leaves">Number of Leaves <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="number_of_leaves" value="{{ old('number_of_leaves', $model->number_of_leaves) }}"/>
                                    <span class="error">{{ $errors->first('number_of_leaves') }}</span>
                                </div>
                                <button type="submit" class="btn btn-primary">Update</button>
                                <a href="{{ route('leave.index') }}" class="btn btn-label-secondary waves-effect">Back</a>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-xl">
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="mb-0">Holiday Leave</h5>
                            <h5 class="mb-0"><a href="{{ route('holidayleave.create') }}" class="float-end"><i class="fas fa-plus"></i>&nbsp;&nbsp;Add</a></h5>
                        </div>
                        <div class="table-responsive text-nowrap">
                            @livewire('holiday-leave-list')
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endsection