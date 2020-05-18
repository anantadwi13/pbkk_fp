
        <div id="page-container" class="sidebar-o page-header-fixed side-scroll page-header-glass main-content-boxed sidebar-inverse">

            {{ partial('sidebar') }}

            {{ partial('header') }}

            {{ content() }}

            {{ partial('footer') }}
        </div>

        <script src="{{ url('/') }}assets/js/codebase.core.min.js"></script>
        <script src="{{ url('/') }}assets/js/codebase.app.min.js"></script>

        <script src="{{ url('/') }}assets/js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script src="{{ url('/') }}assets/js/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
        <script src="{{ url('/') }}assets/js/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
        <script src="{{ url('/') }}assets/js/plugins/select2/js/select2.full.min.js"></script>
        <script src="{{ url('/') }}assets/js/plugins/jquery-tags-input/jquery.tagsinput.min.js"></script>
        <script src="{{ url('/') }}assets/js/plugins/jquery-auto-complete/jquery.auto-complete.min.js"></script>
        <script src="{{ url('/') }}assets/js/plugins/masked-inputs/jquery.maskedinput.min.js"></script>
        <script src="{{ url('/') }}assets/js/plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
        <script src="{{ url('/') }}assets/js/plugins/dropzonejs/dropzone.min.js"></script>
        <script src="{{ url('/') }}assets/js/plugins/pwstrength-bootstrap/pwstrength-bootstrap.min.js"></script>

        <script>
                jQuery(function(){
                        Codebase.helpers(['datepicker', 'colorpicker', 'maxlength', 'select2', 'masked-inputs', 'rangeslider', 'tags-inputs']);
                });
        </script>
