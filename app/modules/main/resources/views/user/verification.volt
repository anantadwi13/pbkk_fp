            <!-- Main Container -->
            <main id="main-container">

                <!-- Page Content -->
                <div class="content">
                    {{ flashSession.output() }}

                    <h2 class="content-heading">Verification Tables</h2>

                    <!-- Full Table -->
                    <div class="block">
                        <div class="block-header block-header-default">
                            <h3 class="block-title">Users</h3>
                        </div>
                        <div class="block-content">
                            <!--<p>The first way to make a table responsive, is to wrap it with <code>&lt;div class=&quot;table-responsive&quot;&gt;&lt;/div&gt;</code>. This way the table will be horizontally scrollable and all data will be accessible on smaller screens (&lt; 768px).</p>-->
                            <div class="table-responsive">
                                <table class="table table-striped table-vcenter">
                                    <thead>
                                        <tr>
                                            <th class="text-center"></th>
                                            <th>Name</th>
                                            <th style="width: 30%;">Email</th>
                                            <th style="width: 15%;">Role</th>
                                            <th class="text-center" style="width: 100px;">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {% if users|length == 0 %}
                                            <tr>
                                                <td class="text-center" colspan="5">-</td>
                                            </tr>
                                        {% endif %}
                                        {% for user in users %}
                                            <tr>
                                                <td class="text-center">{{ loop.index }}</td>
                                                <td class="font-w600">{{ user.name }}</td>
                                                <td>{{ user.email }}</td>
                                                <td>
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
                                                <td class="text-center">
                                                    <form method="post">
                                                        <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                                                        <input type="hidden" name="id" value="{{ user.id }}">
                                                        <div class="btn-group">
{#                                                            <button type="button" class="btn btn-sm btn-secondary" data-toggle="tooltip" title="Send Again">#}
{#                                                                <i class="fa fa-envelope"></i>#}
{#                                                            </button>#}
                                                            <button type="submit" class="btn btn-sm btn-secondary" data-toggle="tooltip" name="verify" value="1" title="Verify">
                                                                <i class="fa fa-check"></i>
                                                            </button>
                                                            <button type="submit" class="btn btn-sm btn-secondary" data-toggle="tooltip" name="verify" value="0" title="Block">
                                                                <i class="fa fa-times"></i>
                                                            </button>
                                                        </div>
                                                    </form>
                                                </td>
                                            </tr>
                                        {% endfor %}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- END Full Table -->

                </div>
                <!-- END Page Content -->

            </main>
            <!-- END Main Container -->