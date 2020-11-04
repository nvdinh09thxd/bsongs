<%@page import="models.Category"%>
<%@page import="models.Song"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath() %>/templates/admin/js/jquery-2.1.1.min.js"></script>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý bài hát</h2>
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
                                <div class="col-sm-6">
                                    <a href="<%=request.getContextPath() %>/admin/song/add" class="btn btn-success btn-md">Thêm</a>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                <%
                                	List<Category> listCat = (List<Category>) request.getAttribute("listCat");
                                %>
                                <form method="post" action="">
                                <%
                                	if(listCat != null && listCat.size() > 0){
                                %>
		                              <select id="catId" onchange="onSelectCat()">
			                               <option value="0">--Chọn danh mục--</option>
			                               <%
			                               for(Category cat: listCat){
			                               %>
			                               <option value="<%=cat.getId()%>"><%=cat.getName()%></option>
			                               <%} %>
		                              </select>
	                              <%} %>
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
								  Thêm bài hát thành công!
							</div>
							<%} else if ("2".equals(msg)) {%>
								<div class="alert alert-success" role="alert">
								  Sửa bài hát thành công!
							</div>
							<%} else if ("3".equals(msg)) {%>
								<div class="alert alert-success" role="alert">
								  Xóa bài hát thành công!
							</div>
							<%} else if ("4".equals(msg)) {%>
								<div class="alert alert-danger" role="alert">
								  Bài hát không tồn tại!
							</div>
							<%} else if ("0".equals(msg)) {%>
								<div class="alert alert-danger" role="alert">
								  Xóa bài hát thất bại!
							</div>
							<%}} %>
        <hr />
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên bài hát</th>
                                        <th>Danh mục</th>
                                        <th>Lượt đọc</th>
                                        <th>Hình ảnh</th>
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>                                
                                <%
                                if(request.getAttribute("listSong")!=null){
                                	List<Song> listSong = (List<Song>) request.getAttribute("listSong");
                                	if(listSong.size()>0){
                                		for(Song song: listSong){
                                			String urlEdit = request.getContextPath()+"/admin/song/edit?sid="+song.getId();
                                			String urlDel = request.getContextPath()+"/admin/song/del?sid="+song.getId();
                                			String urlPicture = request.getContextPath() + "/uploads/images/";
                                			urlPicture += !"".equals(song.getPicture())? song.getPicture() : "no-image.jpg";
                                %>                                
                                    <tr>
                                        <td><%=song.getId() %></td>
                                        <td class="center"><%=song.getName() %></td>
                                        <td class="center"><%=song.getCat().getName() %></td>
                                        <td class="center"><%=song.getCount() %></td>
                                        <td class="center">
                                        <img width="200px" height="200px" 
											src="<%=urlPicture%>" alt="<%=urlPicture%>" />
                                        </td>
                                        <td class="center">
                                            <a href="<%=urlEdit %>" title="Sửa" class="btn btn-primary"><i class="fa fa-edit "></i> Sửa</a>
                                            <a href="<%=urlDel %>" title="Xóa" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')"><i class="fa fa-pencil"></i> Xóa</a>
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
    document.getElementById("song").classList.add('active-menu');
    function onSelectCat() {
    	  let catId = $("#catId").val();
    	  $.ajax({
				url: '<%=request.getContextPath()%>/admin/song/index',
				type: 'POST',
				cache: false,
				data: {
					acatId: catId,
				},
				success: function(data){
					$("tbody").html(data);
				},
				error: function (){
					alert('Có lỗi xảy ra');
				}
			});
			return false;
    }
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>