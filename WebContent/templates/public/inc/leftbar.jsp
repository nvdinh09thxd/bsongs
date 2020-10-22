<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%@page import="java.util.List"%>
    <%@ page import="models.Category"%>
    <%@ page import="daos.CatDAO"%>
    <%@ page import="models.Song"%>
    <%@ page import="daos.SongDAO"%>
<div class="searchform">
	<%
		String songName = (String) request.getAttribute("songName");
	%>
  <form id="formsearch" name="formsearch" method="post" action="<%=request.getContextPath()%>/search">
    <span>
    <input name="name" class="editbox_search" id="editbox_search" maxlength="80" placeholder="Tìm kiếm bài hát" value="<%if(songName!=null) out.print(songName); %>" type="text" />
    </span>
    <input name="button_search" src="<%=request.getContextPath() %>/templates/public/images/search.jpg" class="button_search" type="image" />
  </form>
</div>
<div class="clr"></div>
<div class="gadget">
  <h2 class="star">Danh mục bài hát</h2>
  <div class="clr"></div>
  <ul class="sb_menu">
  <%
  CatDAO catDao = new CatDAO();
  List<Category> listCat = catDao.findAll();
  if(listCat.size()>0){
	  for(Category item : listCat){
  %>
    <li><a id="<%=item.getId()%>" href="<%=request.getContextPath()%>/cat?id=<%=item.getId()%>"><%=item.getName() %></a></li>
    <%
	  }}
    %>
  </ul>
</div>

<div class="gadget">
  <h2 class="star"><span>Bài hát mới</span></h2>
  <div class="clr"></div>
  <ul class="ex_menu">
  <%
  SongDAO songDao = new SongDAO();
  List<Song> listRecentSong = songDao.getItems(6);
  if(listRecentSong.size()>0){
	  for(Song item : listRecentSong){
  %>
    <li><a href="#"><%=item.getName() %></a><br />
      <%if(item.getDescription().length()>50) out.print(item.getDescription().substring(0, 50)+"..."); else out.print(item.getDescription()); %></li>
    <%
	  }}
    %>
  </ul>
</div>