
            <!-- Main Container -->
            <main id="main-container">

                <!-- Page Content -->
                <div class="content">
                    {{ flashSession.output() }}

                    <h2 class="content-heading">Invitation</h2>

                    <!-- Dynamic Table Full -->
                    <div class="block">
                        <div class="block-header block-header-default">
                            <h3 class="block-title">Events</h3>
                        </div>
                        <div class="block-content block-content-full">
                            <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
                            <table class="table table-bordered table-striped table-vcenter js-dataTable-full">
                                <thead>
                                <tr>
                                    <th class="text-center"></th>
                                    <th>Event Name</th>
                                    <th class="text-center">With</th>
                                    <th class="d-none d-sm-table-cell">Time Start</th>
                                    <th class="d-none d-sm-table-cell">Time End</th>
                                    <th class="d-none d-sm-table-cell" style="width: 15%;">Location</th>
                                    <th class="d-none d-sm-table-cell" style="width: 15%;">Status</th>
                                    <th class="d-none d-sm-table-cell" style="width: 15%;">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                {% for event in events %}
                                <tr>
                                    <td class="text-center">{{ loop.index }}</td>
                                    <td class="font-w600">{{ event.name }}</td>
                                    <td class="d-none d-sm-table-cell">
                                        {% if event.amplifier is not empty %}
                                            <a href="{{ url({'for':'collaboration-sound-profile', 'username': event.amplifier.username}) }}" target="_blank">
                                                {{ event.amplifier.name }}
                                            </a>
                                        {% endif %}
                                    </td>
                                    <td class="d-none d-sm-table-cell">{{ event.getReadableTimeStart() }}</td>
                                    <td class="d-none d-sm-table-cell">{{ event.getReadableTimeEnd() }}</td>
                                    <td class="d-none d-sm-table-cell">{{ event.location }}</td>
                                    <td class="d-none d-sm-table-cell">
                                        {% if event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_DELETED')) %}
                                            <span class="badge badge-danger">Deleted</span>
                                        {% elseif event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_FOLLOWED_UP'))
                                            and event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_ACCEPTED'))%}
                                            <span class="badge badge-success">Accepted</span>
                                        {% elseif event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_FOLLOWED_UP'))
                                            and not event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_ACCEPTED'))%}
                                            <span class="badge badge-danger">Rejected</span>
                                        {% elseif event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_READ')) %}
                                            <span class="badge badge-info">Read</span>
                                        {% else %}
                                            <span class="badge badge-secondary">Need Action</span>
                                        {% endif %}
                                    </td>
                                    <td class="text-center">
                                        <div class="modal fade text-left" id="modal-popout-{{ loop.index }}" tabindex="-1" role="dialog" aria-labelledby="modal-popout" style="display: none;" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-popout" role="document">
                                                <div class="modal-content">
                                                    <div class="block block-themed block-transparent mb-0">
                                                        <div class="block-header bg-primary-dark">
                                                            <h3 class="block-title">Detail Event</h3>
                                                            <div class="block-options">
                                                                <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                                                    <i class="si si-close"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="block-content">
                                                            <div class="form-group row">
                                                                <div class="col-md-12">
                                                                    <div class="form-material">
                                                                        <label>Event Name</label>
                                                                        <span class="form-control">
                                                                            {{ event.name }}
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            {% if event.amplifier is not empty %}
                                                            <div class="form-group row">
                                                                <div class="col-md-12">
                                                                    <div class="form-material">
                                                                        <label>Amplifier Name</label>
                                                                        <span class="form-control">
                                                                            <a href="{{ url({'for':'collaboration-sound-profile', 'username': event.amplifier.username}) }}" target="_blank">
                                                                                {{ event.amplifier.name }}
                                                                            </a>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            {% endif %}
                                                            <div class="form-group row">
                                                                <div class="col-md-12">
                                                                    <div class="form-material">
                                                                        <label>Description</label>
                                                                        <span class="form-control">
                                                                            {{ event.description }}
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-md-12">
                                                                    <div class="form-material">
                                                                        <label>Time Start</label>
                                                                        <span class="form-control">
                                                                            {{ event.getReadableTimeStart() }}
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-md-12">
                                                                    <div class="form-material">
                                                                        <label>Time End</label>
                                                                        <span class="form-control">
                                                                            {{ event.getReadableTimeEnd() }}
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-md-12">
                                                                    <div class="form-material">
                                                                        <label>Location</label>
                                                                        <span class="form-control">
                                                                            {{ event.location }}
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-md-12">
                                                                    <div class="form-material">
                                                                        <label>Status</label>
                                                                        <span class="form-control">
                                                                            {% if event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_DELETED')) %}
                                                                                <span class="badge badge-danger">Deleted</span>
                                                                            {% elseif event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_FOLLOWED_UP'))
                                                                                and event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_ACCEPTED'))%}
                                                                                <span class="badge badge-success">Accepted</span>
                                                                            {% elseif event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_FOLLOWED_UP'))
                                                                                and not event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_ACCEPTED'))%}
                                                                                <span class="badge badge-danger">Rejected</span>
                                                                            {% elseif event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_READ')) %}
                                                                                <span class="badge badge-info">Read</span>
                                                                            {% else %}
                                                                                <span class="badge badge-secondary">Need Action</span>
                                                                            {% endif %}
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-md-12">
                                                                    <div class="form-material">
                                                                        <label>Created At</label>
                                                                        <span class="form-control">
                                                                            {{ event.getReadableCreatedAt() }}
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-md-12">
                                                                    <div class="form-material">
                                                                        <label>Last Update</label>
                                                                        <span class="form-control">
                                                                            {{ event.getReadableUpdatedAt() }}
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <a href="#"  data-toggle="modal" data-target="#modal-popout-{{ loop.index }}">
                                            <button type="button" class="btn btn-sm btn-info"  data-toggle="tooltip" title="Detail">
                                                <i class="fa fa-info"></i>
                                            </button>
                                        </a>
                                        <form action="{{ url({'for':'collaboration-event-followup', 'id': event.id}) }}"
                                              method="post" style="display: inline-block" onsubmit="return confirm('Do you really want to do this action?');">
                                            <input hidden name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                                            <input hidden name="id" value="{{ event.id }}">
                                            <button type="submit" class="btn btn-sm btn-success"  data-toggle="tooltip" title="Accept" name="status" value="1">
                                                <i class="fa fa-check"></i>
                                            </button>
                                            <button type="submit" class="btn btn-sm btn-danger" data-toggle="tooltip" title="Reject" name="status" value="0">
                                                <i class="fa fa-remove"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                {% endfor %}
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END Dynamic Table Full -->

                </div>
                <!-- END Page Content -->

            </main>
            <!-- END Main Container -->