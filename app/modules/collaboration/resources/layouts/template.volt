<!doctype html>
<html lang="en" class="no-focus">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

        <title>{% if title is defined %}{{ title }}{% else %}{{ 'Dengar.in - Collaboration' }}{% endif %}</title>

        <meta name="description" content="Dengar.in">
        <meta name="author" content="pixelcave">
        <meta name="robots" content="noindex, nofollow">

        <!-- Open Graph Meta -->
        <meta property="og:title" content="Codebase - Bootstrap 4 Admin Template &amp; UI Framework">
        <meta property="og:site_name" content="Codebase">
        <meta property="og:description" content="Codebase - Bootstrap 4 Admin Template &amp; UI Framework created by pixelcave and published on Themeforest">
        <meta property="og:type" content="website">
        <meta property="og:url" content="">
        <meta property="og:image" content="">

        <!-- Icons -->
        <!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
        <link rel="shortcut icon" href="{{ url('/') }}assets/media/favicons/favicon.png">
        <link rel="icon" type="image/png" sizes="192x192" href="{{ url('/') }}assets/media/favicons/favicon-192x192.png">
        <link rel="apple-touch-icon" sizes="180x180" href="{{ url('/') }}assets/media/favicons/apple-touch-icon-180x180.png">
        <!-- END Icons -->

        <!-- Stylesheets -->

        <link rel="stylesheet" href="{{ url('/') }}assets/js/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">
        <link rel="stylesheet" href="{{ url('/') }}assets/js/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
        <link rel="stylesheet" href="{{ url('/') }}assets/js/plugins/select2/css/select2.min.css">
        <link rel="stylesheet" href="{{ url('/') }}assets/js/plugins/jquery-tags-input/jquery.tagsinput.min.css">
        <link rel="stylesheet" href="{{ url('/') }}assets/js/plugins/jquery-auto-complete/jquery.auto-complete.min.css">
        <link rel="stylesheet" href="{{ url('/') }}assets/js/plugins/ion-rangeslider/css/ion.rangeSlider.css">
        <link rel="stylesheet" href="{{ url('/') }}assets/js/plugins/ion-rangeslider/css/ion.rangeSlider.skinHTML5.css">
        <link rel="stylesheet" href="{{ url('/') }}assets/js/plugins/dropzonejs/dist/dropzone.css">

        <link rel="stylesheet" href="{{ url('/') }}assets/js/plugins/datatables/dataTables.bootstrap4.css">

        <!-- Fonts and Codebase framework -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:300,400,400i,600,700">
        <link rel="stylesheet" id="css-main" href="{{ url('/') }}assets/css/codebase.min.css">
        <link rel="stylesheet" id="css-theme" href="{{ url('/') }}assets/css/themes/pulse.min.css">

        <!-- You can include a specific file from css/themes/ folder to alter the default color theme of the template. eg: -->
        <!-- <link rel="stylesheet" id="css-theme" href="assets/css/themes/flat.min.css"> -->
        <!-- END Stylesheets -->
    </head>
    <body>
        {{ content() }}
        <script type="application/javascript">
            $('document').on('ready', function () {
                Codebase.layout('sidebar_close');
            });
        </script>
    </body>
</html>