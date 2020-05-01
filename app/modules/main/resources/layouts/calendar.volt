
        <div id="page-container" class="sidebar-o page-header-fixed side-scroll page-header-glass main-content-boxed">

            {{ partial('sidebar') }}

            {{ partial('header') }}

            {{ content() }}

            {{ partial('footer') }}
        </div>

        <script src="{{ url('/') }}assets/js/codebase.core.min.js"></script>
        <script src="{{ url('/') }}assets/js/codebase.app.min.js"></script>

        <!-- Page JS Plugins -->
        <script src="{{ url('/') }}assets/js/plugins/jquery-ui/jquery-ui.min.js"></script>
        <script src="{{ url('/') }}assets/js/plugins/moment/moment.min.js"></script>
        <script src="{{ url('/') }}assets/js/plugins/fullcalendar/fullcalendar.min.js"></script>

        <script type="text/javascript">
            class BeCompCalendar {
                /*
                 * Init calendar demo functionality
                 *
                 */
                static initCalendar() {
                    let date = new Date();
                    let d    = date.getDate();
                    let m    = date.getMonth();
                    let y    = date.getFullYear();

                    jQuery('.js-calendar').fullCalendar({
                        firstDay: 1,
                        header: {
                            left: 'title',
                            right: 'prev,next today month,agendaWeek,agendaDay,listWeek'
                        },
                        navLinks: true, // can click day/week names to navigate views
                        eventLimit: true, // allow "more" link when too many events
                        timeFormat: 'HH:mm',
                        events: {
                            url: '{{ url({'for': 'api-collaboration-event-index'}) }}',
                            method: 'POST',
                            data: {
                                {% if user.role == constant('Dengarin\Main\Models\User::ROLE_SOUND') %}
                                    sound_id: {{ user.id }},
                                {% elseif user.role == constant('Dengarin\Main\Models\User::ROLE_AMPLIFIER') %}
                                    amplifier_id: {{ user.id }},
                                {% endif %}
                            },
                        }
                    });
                }

                /*
                 * Init functionality
                 *
                 */
                static init() {
                    this.initCalendar();
                }
            }

            // Initialize when page loads
            jQuery(() => { BeCompCalendar.init(); });
        </script>