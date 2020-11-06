<%@page import="models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Sửa người dùng</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                            <%
								if(request.getParameter("msg")!=null){
									String msg = request.getParameter("msg");
									if("1".equals(msg)){
                            %>
                            <div class="alert alert-danger" role="alert">
								  Vui lòng nhập username vào!
							</div>
							<%} else if("2".equals(msg)) { %>
							<div class="alert alert-danger" role="alert">
								  Vui lòng nhập password vào!
							</div>
							<%} else if("3".equals(msg)) { %>
							<div class="alert alert-danger" role="alert">
								  Vui lòng nhập fullname vào!
							</div>
							<%} else if("4".equals(msg)) { %>
							<div class="alert alert-danger" role="alert">
								  Bạn nhập username đã tồn tại!
							</div>
							<%} else if("0".equals(msg)) { %>
							<div class="alert alert-danger" role="alert">
  								Xử lý thất bại!
							</div>
							<%}} %>
							<%
								String username = request.getParameter("username");
                            	String fullname = request.getParameter("fullname");
								if(request.getAttribute("itemUser")!=null){
									User itemUser = (User) request.getAttribute("itemUser");
									username = itemUser.getUsername();
									fullname = itemUser.getFullname();
								}
							%>
                                <form role="form" method="post" id="form">
                                    <div class="form-group">
                                        <label for="name">Username</label>
                                        <input type="text" id="username" value="<%if(!"".equals(username)) out.print(username); %>" name="username" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Password</label>
                                        <input type="password" id="password" value="" name="password" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Fullname</label>
                                        <input type="text" id="fullname" value="<%if(!"".equals(fullname)) out.print(fullname); %>" name="fullname" class="form-control" />
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Sửa</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Form Elements -->
            </div>
        </div>
        <!-- /. ROW  -->
    </div>
    <!-- /. PAGE INNER  -->
</div>
<script>
    document.getElementById("user").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>