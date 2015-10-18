<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>EAPS Conf</title>
    <spring:url value="/resources/jquery-2.1.4.js" var="jqueryJs" />
    <spring:url value="/resources/delete.png" var="delImage" />
    <script src="${jqueryJs}"></script>
    <style>
        ul {
            padding: 0;
            margin-left: 170px;
        }
    </style>
</head>

<body>

<script type="text/javascript">
    var total = 0;
    var total2 = 0;
    function add_new_vlan_block(){
        total++;
        $('<tr>')
                .attr('id','tr_image_'+total)
                .css({lineHeight:'20px'})
                .append (
                $('<td>')
                        .attr('id','td_title_'+total)
                        .css({paddingRight:'5px',width:'200px'})
                        .append(
                        $('<input type="text" />')
                                .css({width:'200px'})
                                .attr('id','vlan_name_'+total)
                                .attr('name','vlan_name_'+total)
                        )
                )
                .append (
                $('<td>')
                        .attr('id','td_title_'+total)
                        .css({paddingRight:'5px',width:'30px'})
                        .append(
                        $('<input type="text" />')
                                .css({width:'30px'})
                                .attr('id','vlan_number_'+total)
                                .attr('name','vlan_number_'+total)
                                .attr('maxlength','4')
                         )
                )
                .append (
                $('<td>')
                        .css({width:'60px'})
                        .append (
                        $('<span id="progress_'+total+'" class="padding5px"><a  href="#" onclick="$(\'#tr_image_'+total+'\').remove();" class="ico_delete"><img src="${delImage}" alt="del" border="0"></a></span>')
                        )
                 )
                .appendTo('#table_container');

    }

    function getEapses() {
        $.get("http://localhost:8080/eaps/eapses", function (data) {
           eapsJsList = data;
        }, "json");

    }

    function findNodes(eapsName) {
        var i;
        var nodes = null;
        for (i=0; i< eapsJsList.length; i++) {
            var eaps = eapsJsList[i];
            if (eaps.name === eapsName) {
                nodes = eaps.nodes;
                return nodes;
            }
        }
    }

    function changeSelected(id,elementValue) {
        var select = $("#"+ id);
        var nodes = findNodes(elementValue);
        select.empty().append('<option value="Nope" selected hidden>Select master node</option>')
                for (var i=0; i < nodes.length; i++) {
                    select.append( $('<option value=' + nodes[i] + '>' + nodes[i] + '</option>'))
                }
    }

    function add_new_eaps_nodes_block(){
        total2++;
        $('<tr>')
                .attr('id','tr_image2_'+total2)
                .css({lineHeight:'20px'})
                .append(
                $('<select onchange="changeSelected(this.name, this.value)">')
                        .append( $('<option value="Nope" selected hidden>Select eaps</option>'))
                        <c:forEach items="${eapsList}" var="eaps">
                        <c:out value=".append( $('<option value=${eaps.name}>${eaps.name}</option>'))" escapeXml="false" />
                        </c:forEach>
                        .css({width:'100px'})
                        .attr('id','EAPS_title_'+total2)
                        .attr('name','EAPS_name_'+total2)
                )
                .append(
                $('<select id="selnode" name="master">')
                        .append( $('<option value="Nope" selected hidden>Select master node</option>'))
                        .css({width:'135px'})
                        .attr('id','EAPS_name_'+total2)
                        .attr('name','node_title_'+total2)
                )
                .append (
                $('<td>')
                        .css({width:'60px'})
                        .append (
                        $('<span id="progress_'+total2+'" class="padding5px"><a  href="#" onclick="$(\'#tr_image2_'+total2+'\').remove();" class="ico_delete"><img src="${delImage}" alt="del" border="0"></a></span>')
                        )
                )
                .appendTo('#table_container2');
    }

    $(document).ready(function() {
        getEapses();
        add_new_vlan_block();
        add_new_eaps_nodes_block();
    });

</script>

<form name="forma1" action="http://localhost:8080/eaps/conf" method="post">
    <table>
        <tr>
            <td><table id="table_container">
                <tr>
                    <td width="100px" colspan="2"><pre><strong>      Vlan Name            Vlan ID</strong></pre></td>
                </tr>
            </table>
                <input type="button" value="Add Vlan" onclick="return add_new_vlan_block();"></td>

            <td><table id="table_container2">
                <tr>
                    <td width="100px" colspan="2"><pre><strong>    Choose EAPS</strong></pre></td>
                </tr>
            </table>
                <input type="button" value="Add EAPS" onclick="return add_new_eaps_nodes_block();"></td>
        </tr><tr><hr><td><hr><td><hr></td></tr><tr><td>
                <ul>
                    <input type="submit" value="Configure">
                </ul>
            </td></tr>
    </table>
</form>

</body>
</html>