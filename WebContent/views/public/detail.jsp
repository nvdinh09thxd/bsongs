<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
  <%
  	Song itemSong = null;
	if(request.getAttribute("itemSong")!=null){
	itemSong = (Song) request.getAttribute("itemSong");
  %>
    <div class="article">
      <h1><%=itemSong.getName() %></h1>
      <div class="clr"></div>
      <p>Ngày đăng: <%=itemSong.getCreateAt() %>. Lượt xem: <%=itemSong.getCounter() %></p>
      <div class="vnecontent">
          <%=itemSong.getDetail() %>
      </div>
    </div>
    <%
  }
    %>
    <div class="article">
      <h2>Bài viết liên quan</h2>
      <div class="clr"></div>
      <%
      if(request.getAttribute("relatedSongs")!=null){
	      @SuppressWarnings("unchecked")
	      List<Song> relatedSongs = (List<Song>) request.getAttribute("relatedSongs");
	      if(relatedSongs.size()>0){
	    	  for(Song item: relatedSongs){
	    		String urlPicture = request.getContextPath() + "/uploads/images/";
	    	  	urlPicture += !"".equals(item.getPicture())? item.getPicture() : "no-image.jpg";
      %>
      <div class="comment">
      <a href="<%=request.getContextPath()%>/detail?id=<%=item.getId() %>">
      <img src="<%=urlPicture %>" width="40" height="40" alt="<%=urlPicture %>" class="fl" />
      </a>
        <h2><a href="<%=request.getContextPath()%>/detail?id=<%=item.getId() %>"><%=item.getName() %></a></h2>
        <p><%=item.getDescription() %></p>
      </div>
      <%
    	  }}}
      %>
    </div>
  </div>
  <div class="sidebar">
  <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<script>
	<%if(itemSong!=null){%>
    	document.getElementById("<%=itemSong.getCat().getId()%>").classList.add('active_cat');
	<%}%>
	document.getElementById("home").classList.add('active');
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>
