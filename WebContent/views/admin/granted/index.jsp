<%@page import="models.Granted"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp"%>
<%@ include file="/templates/admin/inc/leftbar.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/templates/admin/js/jquery-2.1.1.min.js"></script>
<div id="page-wrapper">
	<div id="page-inner">
		<div class="row">
			<div class="col-md-12">
				<h2>Phân Quyền</h2>
			</div>
		</div>
		<!-- /. ROW  -->
		<hr />
		<div class="row">
			<div class="col-md-12">
				<!-- Advanced Tables -->
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="table-responsive">

							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<td>Tên Quyền</td>
										<th>Thêm</th>
										<th>Sửa</th>
										<th>Xóa</th>
									</tr>
								</thead>
								<tbody>

										
										<%
											if (request.getAttribute("listGranted") != null) {
											List<Granted> listGranted = (List<Granted>) request.getAttribute("listGranted");
											if (listGranted.size() > 0) {
												for (Granted objGranted : listGranted) {
										%>
									<tr>
										<td><%=objGranted.getName()%></td>
										<td><a href="javascript:void(0)" title=""><img
												id="<%=objGranted.getId() %>" alt="addon"
												src="<%=request.getContextPath()%>/uploads/images/<%if(objGranted.getAdd()) out.print("tick.png"); else out.print("cancel.png");%>"
												style="width: 45px; height: 45px; text-align: center;"></a>
										</td>
										<td><a href="javascript:void(0)" title=""><img
												id="<%=objGranted.getId() %>" alt="edit"
												src="<%=request.getContextPath()%>/uploads/images/<%if(objGranted.getEdit()) out.print("tick.png"); else out.print("cancel.png");%>"
												style="width: 45px; height: 45px; text-align: center;"></a>
										</td>
										<td><a href="javascript:void(0)" title=""><img
												id="<%=objGranted.getId() %>" alt="del"
												src="<%=request.getContextPath()%>/uploads/images/<%if(objGranted.getDel()) out.print("tick.png"); else out.print("cancel.png");%>"
												style="width: 45px; height: 45px; text-align: center;"></a>
										</td>
									</tr>
										<%}}} %>
								</tbody>
							</table>

						</div>

					</div>
				</div>
				<!--End Advanced Tables -->
			</div>
		</div>
	</div>
</div>
<script>
		$("img").click(function(){
		    var image = $(this);
		    $.ajax({
				url: '<%=request.getContextPath()%>/admin/granted/index',
			type : 'POST',
			cache : false,
			data : {
				asrc : image.attr("src"),
				aid : image.attr("id"),
				aColName : image.attr("alt")
			},
			success : function(data) {
				image.attr("src", data)
			},
			error : function() {
				alert("Có lỗi xảy ra")
			}
		});
	});
</script>
<script>
	document.getElementById("granted").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp"%>