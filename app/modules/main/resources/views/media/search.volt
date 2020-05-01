            <!-- Main Container -->
            <main id="main-container">

                <!-- Page Content -->
                <div class="content">
                    <!-- Search -->
                    <form class="push" action="{{url({'for':'main-media-search'})}}" method="get">
                        <div class="input-group input-group-lg">
                            <input type="text" class="form-control" name="search" placeholder="Search users here" value="{{ request.get('search') }}">
                            <div class="input-group-append">
                                {% if request.get('search') is not empty %}
                                <a href="{{ url({'for': 'main-media-search'}) }}" class="btn btn-secondary" name="search" value="">
                                    <i class="fa fa-remove"></i>
                                </a>
                                {% endif %}
                                <button type="submit" class="btn btn-secondary">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                    <!-- END Search -->

                    <!-- Results -->
                    <div class="block">
                        <!-- Page Content -->
                        <div class="content">
                            <!-- Simple User Widgets -->
                            <h2 class="content-heading">dengar.in</h2>
                            <div class="row">
                                {% for user in users %}
                                    <div class="col-md-6 col-xl-3">
                                        <a class="block text-center" href="{{ url({'for': 'main-media-portofolio', 'username': user.username}) }}">
                                            {% switch user.role %}
                                                {% case constant('Dengarin\Main\Models\User::ROLE_SOUND') %}
                                                    <div class="block-content block-content-full bg-gd-leaf">
                                                        <i class="fa fa-music fa-4x text-warning-light"></i>
                                                    </div>
                                                {% break %}
                                                {% case constant('Dengarin\Main\Models\User::ROLE_AMPLIFIER') %}
                                                    <div class="block-content block-content-full bg-gd-emerald">
                                                        <i class="fa fa-music fa-4x text-warning-light"></i>
                                                    </div>
                                                {% break %}
                                            {% endswitch %}
                                            <div class="block-content block-content-full">
                                                <div class="font-w600 mb-5">{{ user.name }}</div>
                                                <div class="font-size-sm text-muted">{{ user.username }}</div>
                                            </div>
                                            <div class="block-content block-content-full block-content-sm bg-body-light">
                                                {% switch user.role %}
                                                    {% case constant('Dengarin\Main\Models\User::ROLE_SOUND') %}
                                                        <span class="font-w600 font-size-sm text-success">Sound</span>
                                                    {% break %}
                                                    {% case constant('Dengarin\Main\Models\User::ROLE_AMPLIFIER') %}
                                                        <span class="font-w600 font-size-sm text-corporate">Amplifier</span>
                                                    {% break %}
                                                {% endswitch %}
                                            </div>
                                        </a>
                                    </div>
                                {% endfor %}
                            </div>
                        </div>
                        <!-- END Page Content -->
                    </div>
                    <!-- END Results -->
                </div>
                <!-- END Page Content -->

            </main>
            <!-- END Main Container -->