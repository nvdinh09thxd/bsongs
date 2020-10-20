<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
  <%
  List<Song> listSong = null;
  if(request.getAttribute("listSong")!=null){
	  listSong = (List<Song>) request.getAttribute("listSong");
	  int i=0;
	  for(Song item: listSong){
		  i++;
		  String urlPicture = request.getContextPath() + "/uploads/images/";
		  urlPicture += !"".equals(item.getPicture())? item.getPicture() : "no-image.jpg";
  %>
    <div class="article">
      <h2><a href="<%=request.getContextPath() %>/detail?id=<%=item.getId() %>" title="<%=item.getName() %>"><%=item.getName() %></a></h2>
      <p class="infopost">Ngày đăng: <%=item.getCreateAt() %>. Lượt xem: <%=item.getCount() %> <a href="#" class="com"><span><%=i %></span></a></p>
      <div class="clr"></div>
      <div class="img">
      	<img src="<%=urlPicture %>" width="177" height="213" alt="<%=item.getPicture() %>" class="fl" />
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
    <%
	    int numberOfPages = (Integer) request.getAttribute("numberOfPages");
		int currentPage = (Integer) request.getAttribute("currentPage");
		if(listSong != null && listSong.size() > 0 && numberOfPages > 1){
    %>
    <p class="pages"><small>Trang <%=currentPage %> của <%=numberOfPages %></small>
    <a href="<%=request.getContextPath()%>/index?page=<%=currentPage-1%>" style="<%if(currentPage==1) out.print("display: none");%>">&laquo;</a>
    <%
	    for(int i = 1; i <= numberOfPages; i++){
	    	if(currentPage == i){
    %>
    <span><%=i %></span>
    <%} else { %>
    <a href="<%=request.getContextPath()%>/index?page=<%=i%>"><%=i %></a>
    <%}} %>
    <a href="<%=request.getContextPath()%>/index?page=<%=currentPage+1%>" style="<%if(currentPage==numberOfPages) out.print("display: none");%>">&raquo;</a></p>
  <%} %>
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
