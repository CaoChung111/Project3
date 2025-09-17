
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Thêm tòa nhà</title>
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
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Dashboard</li>
                </ul>
                <!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        Sửa hoặc thêm tòa nhà
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div>
                <!-- /.page-header -->
                <div class="row">
                    <form:form modelAttribute="buildingEdit" method="GET" id="form-edit">
                        <div class="col-xs-12">
                            <form class="form-horizontal" role="form" >
                                <div class="form-group">
                                    <label class="col-xs-3">Tên tòa nhà</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="name" path="name"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Quận</label>
                                    <div class="col-xs-2">
                                        <form:select path="district" class="form-control" >
                                            <form:option value="">---Chọn Quận---</form:option>
                                            <form:options items="${listDistrict}"/>
                                        </form:select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phường</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control"  id="ward" path="ward" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Đường</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control"  id="street" path="street" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Kết cấu</label>
                                    <div class="col-xs-9">
                                        <input class="form-control"  id="structure" name="structure" type="text" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Số tầng hầm</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control"  id="numberOfBasement" path="numberOfBasement" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Diện tích sàn</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control"  id="floorArea" path="floorArea" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Hướng</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="director" path="direction" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Hạng</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="level" path="level" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Diện tích thuê</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="rentArea" path="rentArea" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Giá thuê</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="rentPrice" path="rentPrice" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Mô tả giá</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="rentPriceDescription" path="rentPriceDescription" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phí dịch vụ</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="serviceFee" path="serviceFee"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phí ô tô</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="carFee" path="carFee" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phí mô tô</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="motorbikeFee" path="motoFee" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phí ngoài giờ</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="overtimeFee" path="overtimeFee" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Tiền điện</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="electricityFee" path="electricityFee" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Đặt cọc</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="deposit" path="deposit" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Thanh toán</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="payment" path="payment" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Thời hạn thuê</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="rentTime" path="rentTime" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Thời gian trang trí</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control"  id="decorationTime" path="decorationTime" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Tên quản lý</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="managerName" path="managerName" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">SĐT quản lý</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control"  id="managerPhonenumber" path="managerPhone" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Phí môi giới</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="brokerageFee" path="brokerageFee" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Loại tòa nhà</label>

                                    <div class="col-xs-9">
                                        <form:checkboxes path="typeCode" items="${listTypeCode}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Ghi chú</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" id="note" path="note" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3"></label>
                                    <div class="col-xs-9">
                                        <c:if test="${not empty buildingEdit.id}">
                                            <button class="btn btn-info" type="button" id="btnAddOrUpdateBuilding">Cập nhật tòa nhà</button>
                                            <button class="btn btn-info" type="button" id="btnCancel">Hủy thao tác</button>
                                        </c:if>
                                        <c:if test="${empty buildingEdit.id}">
                                            <button class="btn btn-info" type="button" id="btnAddOrUpdateBuilding">Thêm tòa nhà</button>
                                            <button class="btn btn-info" type="button" id="btnCancel">Hủy thao tác</button>
                                        </c:if>
                                    </div>
                                </div>
                                <form:hidden path="id" id="buildingId"/>
                            </form>
                        </div>
                    </form:form>
                </div>
            </div>
            <!-- /.page-content -->
        </div>
    </div>
    <!-- /.main-content -->
    <script>
        $("#btnAddOrUpdateBuilding").click(function () {
            var data = {};
            var typeCode = [];
            var formData = $("#form-edit").serializeArray();
            $.each(formData, function (i, v) {
                if (v.name != "typeCode") {
                    data["" + v.name + ""] = v.value;
                } else {
                    typeCode.push(v.value);
                }
            });
            data["typeCode"] = typeCode;
            if(typeCode.length > 0){
                addOrUpdateBuilding(data);
            }
            else{
                window.location.href="<c:url value="/admin/building-edit?typeCode=require"/>";
            }
        });

        function addOrUpdateBuilding(data){
            $.ajax({
                type: "POST",
                url: "/api/building",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "JSON",
                success: function (respond) {
                    location.reload();
                    window.location.href="<c:url value="/admin/building-list?message=success"/>";
                },
                error: function (respond) {
                    console.log("FAIL", xhr.status, xhr.responseText);
                    window.location.href="<c:url value="/admin/building-edit?message=error"/>";
                },
            });
        }

        $("#btnCancel").click(function (){
            window.location.href = "/admin/building-list";
        })
    </script>
</body>
</html>
