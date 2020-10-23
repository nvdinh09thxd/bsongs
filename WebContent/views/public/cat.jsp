<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
    <div class="article">
    <%
    	Category itemCat = null;
    	if(request.getAttribute("itemCat")!=null){
    	itemCat = (Category) request.getAttribute("itemCat");
    %>
		<h1><%=itemCat.getName() %></h1>
	<%
   		}
	%>
    </div>
    <%
    if(request.getAttribute("listSongByCategory")!=null){
    @SuppressWarnings("unchecked")
    List<Song> listSongByCategory = (List<Song>) request.getAttribute("listSongByCategory");
    if(listSongByCategory.size()>0){
  	  int i=0;
  	  for(Song item: listSongByCategory){
  		  i++;
  		String urlPicture = request.getContextPath() + "/uploads/images/";
  		urlPicture += !"".equals(item.getPicture())? item.getPicture() : "no-image.jpg";
  		String urlSlug = request.getContextPath()+"/chi-tiet/"
					+ StringUtil.makeSlug(item.getName()) + "-" + item.getId() + ".html";
    %>
    <div class="article">
      <h2><a href="<%=urlSlug %>" title="<%=item.getName() %>"><%=item.getName() %></a></h2>
      <p class="infopost">Ngày đăng: <%=item.getCreateAt() %>. Lượt xem: <%=item.getCount() %> <a href="<%=request.getContextPath() %>/detail?id=<%=item.getId() %>" class="com"><span><%=i %></span></a></p>
      <div class="clr"></div>
      <div class="img">
      	<img src="<%=urlPicture %>" width="177" height="213" alt="<%=urlPicture %>" class="fl" />
	  </div>
      <div class="post_content">
        <p><%=item.getDescription() %></p>
        <p class="spec"><a href="<%=urlSlug %>" class="rm">Chi tiết &raquo;</a></p>
      </div>
      <div class="clr"></div>
    </div>
    <%
  	  }} else {
    %>
    <div class="article">
    <p>Không có bài hát nào!</p>
    </div>
    <%}} %>
    <p class="pages"><small>Trang 1 của 3</small>
    <span>1</span>
    <a href="">2</a>
    <a href="">3</a>
    <a href="#">&raquo;</a></p>
  </div>
  <div class="sidebar">
      <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<script>
	<%if(itemCat!=null){%>
    	document.getElementById("<%=itemCat.getId()%>").classList.add('active_cat');
	<%}%>
	document.getElementById("home").classList.add('active');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>