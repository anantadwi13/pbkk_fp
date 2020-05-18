
        <div id="page-container" class="sidebar-o page-header-fixed side-scroll page-header-glass main-content-boxed sidebar-inverse">

            {{ partial('sidebar') }}

            {{ partial('header') }}

            {{ content() }}

            {{ partial('footer') }}
        </div>

        <script src="{{ url('/') }}assets/js/codebase.core.min.js"></script>
        <script src="{{ url('/') }}assets/js/codebase.app.min.js"></script>

        <script src="{{ url('/') }}assets/js/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="{{ url('/') }}assets/js/plugins/datatables/dataTables.bootstrap4.min.js"></script>
        <script src="{{ url('/') }}assets/js/plugins/jquery-raty/jquery.raty.js"></script>

        <script type="text/javascript">
                class BeCompRating {
                        /*
                         * Init demo rating functionality
                         *
                         */
                        static initRating() {
                                // Set Default options
                                jQuery.fn.raty.defaults.starType    = 'i';
                                jQuery.fn.raty.defaults.hints       = ['Just Bad!', 'Almost There!', 'It’s ok!', 'That’s nice!', 'Incredible!'];

                                // Init Raty on .js-rating class
                                jQuery('.js-rating').each((index, element) => {
                                        let el = jQuery(element);

                                        el.raty({
                                                readOnly: el.data('readonly') || false,
                                                score: el.data('score') || 0,
                                                number: el.data('number') || 5,
                                                cancel: el.data('cancel') || false,
                                                target: el.data('target') || false,
                                                targetScore: el.data('target-score') || false,
                                                precision: el.data('precision') || false,
                                                cancelOff: el.data('cancel-off') || 'fa fa-fw fa-times-circle text-danger',
                                                cancelOn: el.data('cancel-on') || 'fa fa-fw fa-times-circle',
                                                starHalf: el.data('star-half') || 'fa fa-fw fa-star-half text-warning',
                                                starOff: el.data('star-off') || 'fa fa-fw fa-star text-muted',
                                                starOn: el.data('star-on') || 'fa fa-fw fa-star text-warning',
                                                click: function(score, evt) {
                                                        jQuery('#rating-'+this.id).val(score);
                                                }
                                        });
                                });
                        }

                        /*
                         * Init functionality
                         *
                         */
                        static init() {
                                this.initRating();
                        }
                }

                // Initialize when page loads
                jQuery(() => { BeCompRating.init(); });
        </script>

        <script type="text/javascript">

                // DataTables, for more examples you can check out https://www.datatables.net/
                class Datatables {
                        /*
                         * Override a few DataTable defaults
                         *
                         */
                        static exDataTable() {
                                jQuery.extend( jQuery.fn.dataTable.ext.classes, {
                                        sWrapper: "dataTables_wrapper dt-bootstrap4"
                                });
                        }

                        /*
                         * Init full DataTable
                         *
                         */
                        static initDataTableFull() {
                                jQuery('.js-dataTable-full').dataTable({
                                        columnDefs: [ { orderable: false, targets: [ 4 ] } ],
                                        pageLength: 20,
                                        lengthMenu: [[5, 8, 15, 20], [5, 8, 15, 20]],
                                        autoWidth: false
                                });
                        }

                        /*
                         * Init full extra DataTable
                         *
                         */
                        static initDataTableFullPagination() {
                                jQuery('.js-dataTable-full-pagination').dataTable({
                                        pagingType: "full_numbers",
                                        columnDefs: [ { orderable: false, targets: [ 4 ] } ],
                                        pageLength: 20,
                                        lengthMenu: [[5, 8, 15, 20], [5, 8, 15, 20]],
                                        autoWidth: false
                                });
                        }

                        /*
                         * Init simple DataTable
                         *
                         */
                        static initDataTableSimple() {
                                jQuery('.js-dataTable-simple').dataTable({
                                        columnDefs: [ { orderable: false, targets: [ 4 ] } ],
                                        pageLength: 20,
                                        lengthMenu: [[5, 8, 15, 20], [5, 8, 15, 20]],
                                        autoWidth: false,
                                        searching: false,
                                        oLanguage: {
                                                sLengthMenu: ""
                                        },
                                        dom: "<'row'<'col-sm-12'tr>>" +
                                                "<'row'<'col-sm-6'i><'col-sm-6'p>>"
                                });
                        }

                        /*
                         * Init functionality
                         *
                         */
                        static init() {
                                this.exDataTable();
                                this.initDataTableSimple();
                                this.initDataTableFull();
                                this.initDataTableFullPagination();
                        }
                }

                // Initialize when page loads
                jQuery(() => { Datatables.init(); });
        </script>