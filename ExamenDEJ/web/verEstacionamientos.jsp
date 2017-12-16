<%-- 
    Document   : verEstacionamientos
    Created on : 14-dic-2017, 2:55:22
    Author     : benja
--%>

<%@page import="java.util.List"%>
<%@page import="dao.EstacionamientoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Estacionamiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
                <style>
            #map {
                height: 400px;
                width: 50%;
            }

            #elmapa {
                width: 10%;
            }
        </style>
    </head>
    <body>
        <nav class="blue darken-4" role="navigation">
            <div class="nav-wrapper container"><a id="logo-container" href="index.jsp" class="brand-logo yellow-text"><i class="large material-icons left">directions_car</i>Auto Park</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="index.jsp">Inicio</a></li>                    
                    <li><a href="pagarCuentas.jsp">Pagar</a></li>
                    <li><a href="buscarPagos.jsp">Ver Pagos</a></li>
                    <li><a href="ayuda.jsp">Ayuda</a></li>
                    <li><a href="verEstacionamientos.jsp">Ver Estacionamientos</a></li>               
                </ul>
            </div>
        </nav>
        <div class="container">
            <h2 class="center-align">Estacionamientos</h2>
            <div id="map" class="center-block"></div>
        </div>
        <script>
            function initMap() {
                
                var casaBenja = {lat: -33.6311, lng: -70.7654};                
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 16,
                    center: casaBenja
                });
                
                <% List<Estacionamiento> parks = (new EstacionamientoDAO()).Listar(); %>
                
                var markers = [];
                var tempMarker;
                
                <% for (Estacionamiento park : parks) { %>
                    tempMarker = new google.maps.Marker
                                ({ 
                                    position:
                                    {
                                        lat: <%=park.getMapaLatitud()%>,
                                        lng: <%=park.getMapaLongitud()%>
                                    },
                                    map: map,
                                    label: '<%=park.getNombreEsta()%>'
                                });
                    markers.push(tempMarker);
                <% } %>
            }
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAv1J4q_RwQyBqrQjGNB-4KDc4914pQ78I&callback=initMap">
        </script>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script> 
    </body>
</html>
