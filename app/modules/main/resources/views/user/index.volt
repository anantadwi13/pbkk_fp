<!-- Main Container -->
            <main id="main-container">

                <!-- Page Content -->
                <div class="content">
                    <h2 class="content-heading">User Management Tables</h2>

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
                                    {% for user in users %}
                                    <tr>
                                        <td class="text-center">{{ loop.index }}</td>
                                        <td class="font-w600">{{ user.username }}</td>
                                        <td class="d-none d-sm-table-cell">{{ user.email }}</td>
                                        <td class="d-none d-sm-table-cell">{{ user.name }}</td>
                                        <td class="d-none d-sm-table-cell">customPassword</td>
                                        <td class="d-none d-sm-table-cell">
                                            {% switch user.role %}
                                            {% case constant('Dengarin\Main\Models\User::ROLE_ADMIN') %}
                                                <span class="badge badge-secondary">Admin</span>
                                            {% break %}
                                            {% case constant('Dengarin\Main\Models\User::ROLE_SOUND') %}
                                                <span class="badge badge-success">Sound</span>
                                            {% break %}
                                            {% case constant('Dengarin\Main\Models\User::ROLE_AMPLIFIER') %}
                                                <span class="badge badge-info">Amplifier</span>
                                            {% break %}
                                            {% endswitch %}
                                        </td>
                                        <td class="d-none d-sm-table-cell">
                                            {% if user.isStatus(constant('Dengarin\Main\Models\User::STATUS_DISABLED')) %}
                                                <span class="badge badge-danger">Banned</span>
                                            {% elseif user.isStatus(constant('Dengarin\Main\Models\User::STATUS_VERIFIED_ACCOUNT')) %}
                                                <span class="badge badge-primary">Aktif</span>
                                            {% else %}
                                                <span class="badge badge-secondary">Tidak Aktif</span>
                                            {% endif %}
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
                                    {% endfor %}
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END Dynamic Table Full Pagination -->

                </div>
                <!-- END Page Content -->

            </main>
            <!-- END Main Container -->