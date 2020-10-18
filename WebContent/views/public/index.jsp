<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
  <%
  if(request.getAttribute("listSong")!=null){
	  @SuppressWarnings("unchecked")
	  List<Song> listSong = (List<Song>) request.getAttribute("listSong");
	  int i=0;
	  for(Song item: listSong){
		  i++;
  %>
    <div class="article">
      <h2><a href="<%=request.getContextPath() %>/detail?id=<%=item.getId() %>" title="<%=item.getName() %>"><%=item.getName() %></a></h2>
      <p class="infopost">Ngày đăng: <%=item.getCreateAt() %>. Lượt xem: <%=item.getCount() %> <a href="#" class="com"><span><%=i %></span></a></p>
      <div class="clr"></div>
      <div class="img">
     	<%if(!"".equals(item.getPicture())){ %>
      	<img src="<%=request.getContextPath() %>/uploads/images/<%=item.getPicture() %>" width="177" height="213" alt="<%=item.getPicture() %>" class="fl" />
      	<%}else{ %>
      	<img src="<%=request.getContextPath() %>/uploads/images/no-image.jpg" width="177" height="213" alt="<%=item.getPicture() %>" class="fl" />
      	<%} %>
      </div>
      <div class="post_content">
        <p><%=item.getDescription() %></p>
        <p class="spec"><a href="<%=request.getContextPath() %>/detail?id=<%=item.getId() %>" class="rm">Chi tiết &raquo;</a></p>
      </div>
      <div class="clr"></div>
    </div>
    <%
	  }} else {
    %>
    <div class="article">
    <p>Không có bài hát nào!</p>
    </div>
    <%} %>
    <p class="pages"><small>Trang 1 của 5</small>
    <span>1</span>
    <a href="">2</a>
    <a href="">3</a>
    <a href="">4</a>
    <a href="">5</a>
    <a href="#">&raquo;</a></p>
  </div>
  <div class="sidebar">
      <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<script>
   	document.getElementById("home").classList.add('active');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
