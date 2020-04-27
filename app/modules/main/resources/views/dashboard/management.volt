<!-- Main Container -->
            <main id="main-container">

                <!-- Page Content -->
                <div class="content">
                    <h2 class="content-heading">User Management Tables<small> for {{ name }}: {{ role }} only</small></h2>

                    <!-- Dynamic Table Full Pagination -->
                    <div class="block">
                        <div class="block-header block-header-default">
                            <h3 class="block-title">Tabel Users</h3>
                        </div>
                        <div class="block-content block-content-full">
                            <!-- DataTables functionality is initialized with .js-dataTable-full-pagination class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
                            <table class="table table-bordered table-striped table-vcenter js-dataTable-full-pagination">
                                <thead>
                                    <tr>
                                        <th class="text-center"></th>
                                        <th>Username</th>
                                        <th class="d-none d-sm-table-cell">Email</th>
                                        <th class="d-none d-sm-table-cell">Name</th>
                                        <th class="d-none d-sm-table-cell">Password</th>
                                        <th class="d-none d-sm-table-cell" style="width: 15%;">Role</th>
                                        <th class="d-none d-sm-table-cell" style="width: 15%;">Status</th>
                                        <th class="text-center" style="width: 15%;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">1</td>
                                        <td class="font-w600">Judy Ford</td>
                                        <td class="d-none d-sm-table-cell">customer1@example.com</td>
                                        <td class="d-none d-sm-table-cell">custom Name</td>
                                        <td class="d-none d-sm-table-cell">customPassword</td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-secondary">Admin</span>
                                        </td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-primary">Aktif</span>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Edit">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Delete">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">2</td>
                                        <td class="font-w600">Lisa Jenkins</td>
                                        <td class="d-none d-sm-table-cell">customer2@example.com</td>
                                        <td class="d-none d-sm-table-cell">custom Name</td>
                                        <td class="d-none d-sm-table-cell">customPassword</td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-success">Sound</span>
                                        </td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-primary">Aktif</span>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Edit">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Delete">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">3</td>
                                        <td class="font-w600">Marie Duncan</td>
                                        <td class="d-none d-sm-table-cell">customer3@example.com</td>
                                        <td class="d-none d-sm-table-cell">custom Name</td>
                                        <td class="d-none d-sm-table-cell">customPassword</td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-info">Amplifier</span>
                                        </td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-primary">Aktif</span>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Edit">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Delete">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">4</td>
                                        <td class="font-w600">Melissa Rice</td>
                                        <td class="d-none d-sm-table-cell">customer4@example.com</td>
                                        <td class="d-none d-sm-table-cell">custom Name</td>
                                        <td class="d-none d-sm-table-cell">customPassword</td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-success">Sound</span>
                                        </td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-danger">Non-Aktif</span>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Edit">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Delete">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">5</td>
                                        <td class="font-w600">Wayne Garcia</td>
                                        <td class="d-none d-sm-table-cell">customer5@example.com</td>
                                        <td class="d-none d-sm-table-cell">custom Name</td>
                                        <td class="d-none d-sm-table-cell">customPassword</td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-info">Amplifier</span>
                                        </td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-primary">Aktif</span>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Edit">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Delete">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">6</td>
                                        <td class="font-w600">Amanda Powell</td>
                                        <td class="d-none d-sm-table-cell">customer6@example.com</td>
                                        <td class="d-none d-sm-table-cell">custom Name</td>
                                        <td class="d-none d-sm-table-cell">customPassword</td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-info">Amplifier</span>
                                        </td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-danger">Non-Aktif</span>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Edit">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Delete">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">7</td>
                                        <td class="font-w600">Carol Ray</td>
                                        <td class="d-none d-sm-table-cell">customer7@example.com</td>
                                        <td class="d-none d-sm-table-cell">custom Name</td>
                                        <td class="d-none d-sm-table-cell">customPassword</td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-success">Sound</span>
                                        </td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-danger">Non-Aktif</span>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Edit">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Delete">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">8</td>
                                        <td class="font-w600">Justin Hunt</td>
                                        <td class="d-none d-sm-table-cell">customer8@example.com</td>
                                        <td class="d-none d-sm-table-cell">custom Name</td>
                                        <td class="d-none d-sm-table-cell">customPassword</td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-secondary">Admin</span>
                                        </td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-primary">Aktif</span>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Edit">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Delete">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">9</td>
                                        <td class="font-w600">Jack Estrada</td>
                                        <td class="d-none d-sm-table-cell">customer9@example.com</td>
                                        <td class="d-none d-sm-table-cell">custom Name</td>
                                        <td class="d-none d-sm-table-cell">customPassword</td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-secondary">Admin</span>
                                        </td>
                                        <td class="d-none d-sm-table-cell">
                                            <span class="badge badge-primary">Aktif</span>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Edit">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Delete">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END Dynamic Table Full Pagination -->

                </div>
                <!-- END Page Content -->

            </main>
            <!-- END Main Container -->