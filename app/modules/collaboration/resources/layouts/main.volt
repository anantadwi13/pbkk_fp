
        <div id="page-container" class="sidebar-o page-header-fixed side-scroll page-header-glass main-content-boxed sidebar-inverse">

            {{ partial('sidebar') }}

            {{ partial('header') }}

            {{ content() }}

            {{ partial('footer') }}
        </div>

        <script src="{{ url('/') }}assets/js/codebase.core.min.js"></script>
        <script src="{{ url('/') }}assets/js/codebase.app.min.js"></script>