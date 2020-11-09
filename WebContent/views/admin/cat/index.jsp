<%@page import="models.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý danh mục</h2>
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
                            <div class="row">
                            	<%User userLogin = (User) session.getAttribute("userLogin"); %>
                                <div class="col-sm-6">
                                    <a href="<%=request.getContextPath() %>/admin/cat/add" class="btn btn-success btn-md"
                                    style="<%if(userLogin.getGranted().getAdd()!=1) out.print("display: none");%>">Thêm</a>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <form method="post" action="">
                                        <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm" style="float:right" />
                                        <input type="search" class="form-control input-sm" placeholder="Nhập tên bài hát" style="float:right; width: 300px;" />
                                        <div style="clear:both"></div>
                                    </form><br />
                                </div>
                            </div>
							<%
								if(!"".equals(request.getParameter("msg"))){
									String msg = request.getParameter("msg");
									if("1".equals(msg)){
							%>
							<div class="alert alert-success" role="alert">
								  Thêm danh mục thành công!
							</div>
							<%} else if("2".equals(msg)) { %>
							<div class="alert alert-success" role="alert">
								  Sửa danh mục thành công!
							</div>
							<%} else if("3".equals(msg)) { %>
							<div class="alert alert-success" role="alert">
								  Xóa danh mục thành công!
							</div>
							<%} else if("5".equals(msg)) { %>
							<div class="alert alert-danger" role="alert">
								  Không được phép!
							</div>
							<%}else if("0".equals(msg)) { %>
							<div class="alert alert-danger" role="alert">
  								Xử lý thất bại!
							</div>
							<%}} %>
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên danh mục</th>
                                        <th width="160px" style="<%if(userLogin.getGranted().getEdit()!=1 && userLogin.getGranted().getDel()!=1) out.print("display: none");%>">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                if(request.getAttribute("listCat")!=null){
                                	List<Category> listCat = (List<Category>) request.getAttribute("listCat");
                                	if(listCat.size()>0){
                                		for(Category cat: listCat){
                                			int id = cat.getId();
                                			String name = cat.getName();
                                			String urlDel = request.getContextPath()+"/admin/cat/del?cid="+id;
                                			String urlEdit = request.getContextPath()+"/admin/cat/edit?cid="+id;
                                %>
                                    <tr>
                                        <td><%=id %></td>
                                        <td class="center"><%=name %></td>
                                        <td class="center" style="<%if(userLogin.getGranted().getEdit()!=1 && userLogin.getGranted().getDel()!=1) out.print("display: none");%>">
                                            <a href="<%=urlEdit %>" title="" class="btn btn-primary"
                                            style="<%if(userLogin.getGranted().getEdit()!=1) out.print("display: none");%>"><i class="fa fa-edit "></i> Sửa</a>
                                            <a href="<%=urlDel %>" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')" title="" class="btn btn-danger"
                                            style="<%if(userLogin.getGranted().getDel()!=1) out.print("display: none");%>"><i class="fa fa-pencil"></i> Xóa</a>
                                        </td>
                                    </tr>
									<%}}} %>
                                </tbody>
                            </table>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="dataTables_info" id="dataTables-example_info" style="margin-top:27px">Hiển thị từ 1 đến 5 của 24 truyện</div>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                        <ul class="pagination">
                                            <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="#">Trang trước</a></li>
                                            <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="">1</a></li>
											<li class="paginate_button" aria-controls="dataTables-example" tabindex="0"><a href="">2</a></li>
											<li class="paginate_button" aria-controls="dataTables-example" tabindex="0"><a href="">3</a></li>
											<li class="paginate_button" aria-controls="dataTables-example" tabindex="0"><a href="">4</a></li>
											<li class="paginate_button" aria-controls="dataTables-example" tabindex="0"><a href="">5</a></li>
                                            <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="#">Trang tiếp</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById("category").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>