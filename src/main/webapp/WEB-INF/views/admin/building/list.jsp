
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>
<div class="main-content">
  <div class="main-content-inner">
    <div class="breadcrumbs" id="breadcrumbs">
      <script type="text/javascript">
        try {
          ace.settings.check("breadcrumbs", "fixed");
        } catch (e) {}
      </script>

      <ul class="breadcrumb">
        <li>
          <i class="ace-icon fa fa-home home-icon"></i>
          <a href="<c:url value="/admin/home"/>">
            <%--<spring:message code="label.home"/>--%>
            Trang chủ
          </a>
        </li>
        <li class="active">
          <%--<spring:message code="label.user.list"/>--%>
          Danh sách tòa nhà
        </li>
      </ul>
      <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
      <div class="page-header">
        <h1>
          Danh sách tòa nhà
          <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            overview &amp; stats
          </small>
        </h1>
      </div>
      <!-- /.page-header -->
      <div class="row">
        <div class="col-xs-12">
          <div class="widget-box ui-sortable-handle">
            <div class="widget-header">
              <h5 class="widget-title">Tìm kiếm</h5>

              <div class="widget-toolbar">
                <a href="#" data-action="collapse">
                  <i class="ace-icon fa fa-chevron-up"></i>
                </a>
              </div>
            </div>

            <div
                    class="widget-body"
                    style="font-family: 'Times New Roman', Times, serif; font-weight: 300; font-size: 15px"
            >
              <div class="widget-main" >
                <form:form  id="listForm" action="/admin/building-list" method="GET" modelAttribute="modelSearch">
                  <div class="row">
                    <div class="form-group">
                      <div class="col-xs-12">
                        <div class="col-xs-6">
                          <label class="name">Tên tòa nhà</label>
<%--                          <input type="text" class="form-control" id="name" name="name" value="${modelSearch.name}"/>--%>
                          <form:input path="name" class="form-control"/>
                        </div>
                        <div class="col-xs-6">
                          <label class="name">Diện tích sàn</label>
<%--                          <input type="number" class="form-control" name="floorArea" value="${modelSearch.floorArea}"/>--%>
                          <form:input path="floorArea" class="form-control"/>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-xs-12">
                        <div class="col-xs-2">
                          <label class="name">Quận hiện có</label>
                          <form:select path="district" class="form-control" >
                            <form:option value="">---Chọn Quận---</form:option>
                            <form:options items="${listDistrict}"/>
                          </form:select>
                        </div>
                        <div class="col-xs-5">
                          <label class="name">Phường</label>
<%--                          <input type="text" class="form-control" name="ward" value="${modelSearch.ward}"/>--%>
                          <form:input path="ward" class="form-control"/>
                        </div>
                        <div class="col-xs-5">
                          <label class="name">Đường</label>
<%--                          <input type="text" class="form-control" name="street" value="${modelSearch.street}"/>--%>
                          <form:input path="street" class="form-control"/>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-xs-12">
                        <div class="col-xs-4">
                          <label class="name">Số tầng hầm</label>
<%--                          <input type="text" class="form-control" name="numberOfBasement" value="${modelSearch.numberOfBasement}"/>--%>
                          <form:input path="numberOfBasement" class="form-control"/>
                        </div>
                        <div class="col-xs-4">
                          <label class="name">Hướng</label>
<%--                          <input type="number" class="form-control" name="direction" value="${modelSearch.direction}"/>--%>
                          <form:input path="direction" class="form-control"/>
                        </div>
                        <div class="col-xs-4">
                          <label class="name">Hạng</label>
<%--                          <input type="number" class="form-control" name="level" value="${modelSearch.level}"/>--%>
                          <form:input path="level" class="form-control"/>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-xs-12">
                        <div class="col-xs-3">
                          <label class="name">Diện tích từ</label>
<%--                          <input type="text" class="form-control" name="rentAreaFrom" value=""/>--%>
                          <form:input path="areaFrom" class="form-control"/>
                        </div>
                        <div class="col-xs-3">
                          <label class="name">Diện tích đến</label>
<%--                          <input type="number" class="form-control" name="rentAreaTo" value=""/>--%>
                          <form:input path="areaTo" class="form-control"/>
                        </div>
                        <div class="col-xs-3">
                          <label class="name">Giá thuê từ</label>
<%--                          <input type="number" class="form-control" name="rentPriceFrom" value=""/>--%>
                          <form:input path="rentPriceFrom" class="form-control"/>
                        </div>
                        <div class="col-xs-3">
                          <label class="name">Giá thuê đến</label>
<%--                          <input type="number" class="form-control" name="rentAreaTo" value=""/>--%>
                          <form:input path="rentPriceTo" class="form-control"/>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-xs-12">
                        <div class="col-xs-5">
                          <label class="name">Tên quản lý</label>
<%--                          <input type="text" class="form-control" name="managerName" value=""/>--%>
                          <form:input path="managerName" class="form-control"/>
                        </div>
                        <div class="col-xs-5">
                          <label class="name">Điện thoại quản lý</label>
<%--                          <input type="number" class="form-control" name="managerPhone" value=""/>--%>
                          <form:input path="managerPhone" class="form-control"/>
                        </div>
                        <div class="col-xs-2">
                          <label class="name">Nhân viên</label>
                          <form:select class="form-control" path="staffId">
                            <form:option value="">---Chọn Nhân Viên---</form:option>
                            <form:options items="${listStaffs}"/>
                          </form:select>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-xs-12">
                        <div class="col-xs-6">
                          <form:checkboxes path="typeCode" items="${listTypeCode}"/>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-xs-12">
                        <div class="col-xs-6">
                          <button type="button" class="btn btn-danger" id="btnSearchBuilding">Tìm kiếm</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </form:form>

              </div>
            </div>

            <div class="pull-right">
              <a href="/admin/building-edit">
                <button class="btn btn-info" title="Thêm tòa nhà">
                  <svg
                          xmlns="http://www.w3.org/2000/svg"
                          width="16"
                          height="16"
                          fill="currentColor"
                          class="bi bi-building-add"
                          viewBox="0 0 16 16"
                  >
                    <path
                            d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"
                    />
                    <path
                            d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"
                    />
                    <path
                            d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"
                    />
                  </svg>
                </button>
              </a>

              <button class="btn btn-danger" title="Xóa tòa nhà" id="btnDeleteBuilding">
                <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="16"
                        height="16"
                        fill="currentColor"
                        class="bi bi-building-dash"
                        viewBox="0 0 16 16"
                >
                  <path
                          d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"
                  />
                  <path
                          d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"
                  />
                  <path
                          d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"
                  />
                </svg>
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- Bảng danh sách -->
      <div class="col-xs-12">
        <table id="tablelist" style="margin: 3em 0 0 0" class="table table-striped table-bordered table-hover">
          <thead>
          <tr>
            <th class="center">
              <label class="pos-rel">
                <input type="checkbox" class="ace" />
                <span class="lbl"></span>
              </label>
            </th>
            <th>Tên tòa nhà</th>
            <th>Địa chỉ</th>
            <th>Số tầng hầm</th>
            <th>Tên quản lý</th>
            <th>SĐT quản lý</th>
            <th>DT sàn</th>
            <th>DT trống</th>
            <th>DT thuê</th>
            <th>Phí dịch vụ</th>
            <th>Phí môi giới</th>
            <th>Thao tác</th>
          </tr>
          </thead>

          <tbody>
          <c:forEach var="item" items="${buildingList}">
            <tr>
              <td class="center">
                <label class="pos-rel">
                  <input type="checkbox" class="ace" name="checkList" value="${item.id}"/>
                  <span class="lbl"></span>
                </label>
              </td>

              <td>${item.name}</td>
              <td>${item.address}</td>
              <td>${item.numberOfBasement}</td>
              <td>${item.managerName}</td>
              <td>${item.managerPhone}</td>
              <td>${item.floorArea}</td>
              <td>${item.emptyArea}</td>
              <td>${item.rentArea}</td>
              <td>${item.serviceFee}</td>
              <td>${item.brokerageFee}</td>
              <td>
                <div class="hidden-sm hidden-xs btn-group">
                  <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${item.id})">
                    <i class="ace-icon fa fa-check bigger-120"></i>
                  </button>

                    <a class="btn btn-xs btn-info" href="/admin/building-edit-${item.id}">
                      <i class="ace-icon fa fa-pencil bigger-120"></i>
                    </a>

                  <button class="btn btn-xs btn-danger" onclick="deleteBuilding(${item.id})">
                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                  </button>
                </div>
              </td>
            </tr>
          </c:forEach>

          </tbody>
        </table>
      </div>
    </div>
    <!-- /.page-content -->
  </div>
</div>
<!-- /.main-content -->
<div class="modal fade" id="assignmentBuildingModal" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content -->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Danh sách nhân viên</h4>
      </div>
      <div class="modal-body">
        <table id="staff-list"  class="table table-striped table-bordered table-hover">
          <thead>
          <tr>
            <th class="center">Chọn</th>
            <th>Tên nhân viên</th>
          </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
        <input type="hidden" id="buildingId" name="buildingId" value="" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" id="btnAssignmentBuilding">Giao tòa nhà</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
      </div>
    </div>
  </div>
</div>
<script>
  function assignmentBuilding(buildingId) {
    $("#assignmentBuildingModal").modal();
    loadStaff(buildingId);
    $("#buildingId").val(buildingId);
  }

  function loadStaff(buildingId){
    $.ajax({
      type: "GET",
      url: "/api/building/"+buildingId+"/staffs",
      data: JSON.stringify(buildingId),
      contentType: "application/json",
      dataType: "JSON",
      success: function (response){
        var row='';
        $.each(response.data, function (index, item){
          row+='<tr>';
          row+='<td class="center">';
          row+='<input type="checkbox" id="checkbox_'+item.staffId+'" value="'+item.staffId+'" '+item.checked+' />'
          row+='</td>';
          row+='<td>';
          row+=item.fullName;
          row+='</td>';
          row+='</tr>';
        })
        $("#staff-list tbody").html(row);
        console.log("SUCCESS");
      },
      error: function (response){
        console.log("FAILED");
        console.log(response);
      }
    })
  }

  $("#btnAssignmentBuilding").click(function (e) {
    e.preventDefault();
    var data = {};
    data["buildingId"] = $("#buildingId").val();
    var staffs = $("#staff-list")
            .find("tbody input[type = checkbox]:checked")
            .map(function () {
              return $(this).val();
            })
            .get();
    data["staffs"] = staffs;
    console.log("OK");

    $.ajax({
      type: "PUT",
      url: "/api/building/assignment",
      data: JSON.stringify(data),
      contentType: "application/json",
      dataType: "JSON",
      success: function (response){
        console.log("Success");
        $('#assignmentBuildingModal').modal('hide');

      },
      error: function (response){
        window.location.href="<c:url value="/admin/building-list?message=error"/>";
      }
    });
  });

  $("#btnSearchBuilding").click(function (e){
    e.preventDefault();
    $("#listForm").submit();
  })

  function deleteBuilding(data) {
    var buildingId = [data];
    deleteBuildings(buildingId);
  }

  $("#btnDeleteBuilding").click(function (e){
    e.preventDefault();
    var buildings = $("#tablelist").find("tbody input[type=checkbox]:checked").map(function (){
      return $(this).val()
    }).get();
    deleteBuildings(buildings);
  })

  function deleteBuildings(data){
    $.ajax({
      type: "Delete",
      url: "/api/building/"+data,
      data: JSON.stringify(data),
      contentType: "application/json",
      dataType: "JSON",
      success: function (respond){
        console.log("SUCCESS");
        location.reload();
      },
      error: function (respond){
        console.log("FAIL");
        console.log(respond)
      }
    })
  }

</script>
</body>
</html>
