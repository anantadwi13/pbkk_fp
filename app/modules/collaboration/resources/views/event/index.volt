
            <!-- Main Container -->
            <main id="main-container">

                <!-- Page Content -->
                <div class="content">
                    {{ flashSession.output() }}

                    <h2 class="content-heading">Manage Your Events</h2>

                    <!-- Dynamic Table Full -->
                    <div class="block">
                        <div class="block-header block-header-default">
                            <h3 class="block-title">Events</h3>
                            <h3 class="block-title text-right">
                                {% if auth.role == constant('Dengarin\Main\Models\User::ROLE_SOUND') %}
                                    <a href="{{ url({'for':'collaboration-event-create'}) }}" class="btn btn-sm btn-outline-primary">
                                        Add New Event
                                    </a>
                                {% elseif auth.role == constant('Dengarin\Main\Models\User::ROLE_AMPLIFIER') %}
                                    <a href="{{ url({'for':'main-media-search'}) }}" class="btn btn-sm btn-outline-primary">
                                        Collaborate with Sound
                                    </a>
                                {% endif %}
                            </h3>
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
                                        {% if auth.role == constant('Dengarin\Main\Models\User::ROLE_AMPLIFIER') %}
                                            <a href="{{ url({'for':'main-media-portofolio', 'username': event.sound.username}) }}" target="_blank">
                                                {{ event.sound.name }}
                                            </a>
                                        {% elseif auth.role == constant('Dengarin\Main\Models\User::ROLE_SOUND') %}
                                            {% if event.amplifier is not empty %}
                                                <a href="{{ url({'for':'main-media-portofolio', 'username': event.amplifier.username}) }}" target="_blank">
                                                    {{ event.amplifier.name }}
                                                </a>
                                            {% endif %}
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
                                                            {% if auth.role == constant('Dengarin\Main\Models\User::ROLE_SOUND') and event.amplifier is not empty %}
                                                            <div class="form-group row">
                                                                <div class="col-md-12">
                                                                    <div class="form-material">
                                                                        <label>Amplifier Name</label>
                                                                        <span class="form-control">
                                                                            <a href="{{ url({'for':'main-media-portofolio', 'username': event.amplifier.username}) }}" target="_blank">
                                                                                {{ event.amplifier.name }}
                                                                            </a>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            {% elseif auth.role == constant('Dengarin\Main\Models\User::ROLE_AMPLIFIER') %}
                                                            <div class="form-group row">
                                                                <div class="col-md-12">
                                                                    <div class="form-material">
                                                                        <label>Sound Name</label>
                                                                        <span class="form-control">
                                                                        <a href="{{ url({'for':'main-media-portofolio', 'username': event.sound.username}) }}" target="_blank">
                                                                            {{ event.sound.name }}
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
                                                                        <label>Rating By Sound</label>
                                                                        {% if event.rating_amplifier is empty %}
                                                                            -
                                                                        {% else %}
                                                                        <div class="js-rating" data-score="{{ event.rating_amplifier }}" data-star-on="fa fa-fw fa-2x fa-star text-warning"
                                                                             data-readonly="true" data-star-off="fa fa-fw fa-2x fa-star text-muted"></div>
                                                                        {% endif %}
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-md-12">
                                                                    <div class="form-material">
                                                                        <label>Rating By Amplifier</label>
                                                                        {% if event.rating_sound is empty %}
                                                                            -
                                                                        {% else %}
                                                                        <div class="js-rating" data-score="{{ event.rating_sound }}" data-star-on="fa fa-fw fa-2x fa-star text-warning"
                                                                             data-readonly="true" data-star-off="fa fa-fw fa-2x fa-star text-muted"></div>
                                                                        {% endif %}
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

                                        {% if event.finished and
                                            ((auth.role == constant('Dengarin\Main\Models\User::ROLE_SOUND') and event.rating_amplifier is empty) or
                                            (auth.role == constant('Dengarin\Main\Models\User::ROLE_AMPLIFIER') and event.rating_sound is empty)) %}
                                        <div class="modal fade text-left" id="modal-rating-{{ loop.index }}" tabindex="-1" role="dialog" aria-labelledby="modal-popout" style="display: none;" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-popout" role="document">
                                                <div class="modal-content">
                                                    <form action="{{ url({'for': 'collaboration-event-rating', 'id': event.id}) }}" method="post">
                                                        <input hidden name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                                                        <div class="block block-themed block-transparent mb-0">
                                                            <div class="block-header bg-primary-dark">
                                                                <h3 class="block-title">Rating Event!</h3>
                                                                <div class="block-options">
                                                                    <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                                                        <i class="si si-close"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                            <div class="block-content">
                                                                <!-- Sizes Variations -->
                                                                <div class="block">
                                                                    <div class="block-content">
                                                                        <div class="row items-push-2x text-center text-xl-left">
                                                                            <div class="col-xl-8 offset-xl-2 text-center">
                                                                                <!-- Rating Container -->
                                                                                <div id="{{ event.id }}" class="js-rating" data-score="0" data-star-on="fa fa-fw fa-2x fa-star text-warning" data-star-off="fa fa-fw fa-2x fa-star text-muted"></div>
                                                                                <input id="rating-{{ event.id }}" hidden name="rating" value="">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- END Sizes Variations -->
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-alt-success">Submit</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <a href="#"  data-toggle="modal" data-target="#modal-rating-{{ loop.index }}">
                                            <button type="button" class="btn btn-sm btn-warning"  data-toggle="tooltip" title="Rating Now">
                                                <i class="fa fa-star"></i>
                                            </button>
                                        </a>
                                        {% endif %}



                                        {% if not event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_DELETED')) and (
                                            (auth.role == constant('Dengarin\Main\Models\User::ROLE_SOUND') and event.amplifier_user_id is not defined) or
                                            (auth.role == constant('Dengarin\Main\Models\User::ROLE_AMPLIFIER') and not event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_FOLLOWED_UP')))
                                            ) %}
                                        <a href="{{ url({'for': 'collaboration-event-update', 'id': event.id}) }}" type="button" class="btn btn-sm btn-warning"  data-toggle="tooltip" title="Edit">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        {% endif %}

                                        {% if not event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_DELETED')) and
                                            not event.isStatus(constant('Dengarin\Collaboration\Models\Event::STATUS_FOLLOWED_UP')) %}
                                        <form action="{{ url({'for':'collaboration-event-delete', 'id': event.id}) }}"
                                              method="post" style="display: inline-block" onsubmit="return confirm('Do you really want to delete this event?');">
                                            <input hidden name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                                            <button type="submit" class="btn btn-sm btn-danger" data-toggle="tooltip" title="Delete">
                                                <i class="fa fa-remove"></i>
                                            </button>
                                        </form>
                                        {% endif %}
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