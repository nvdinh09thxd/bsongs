-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 11, 2020 lúc 11:14 AM
-- Phiên bản máy phục vụ: 10.1.32-MariaDB
-- Phiên bản PHP: 7.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bsongs`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Nhạc Hải Ngoại'),
(2, 'Nhạc Việt'),
(3, 'Nhạc chế'),
(4, 'Nhạc Pop'),
(5, 'Nhạc Rock'),
(6, 'Nhạc Thánh'),
(7, 'Nhạc Remix');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `id_song` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `id_song`, `username`, `comment`, `date_create`, `status`) VALUES
(8, 17, 'admin', 'quá tuyệt vời', '2020-11-06 09:55:59', 0),
(13, 10, 'nvdinh185', 'cho nhau', '2020-11-06 09:56:00', 0),
(14, 10, 'admin', 'em yêu anh', '2020-11-06 09:56:01', 0),
(15, 5, 'nvdinh185', 'bài hát hay', '2020-11-06 09:56:01', 0),
(16, 5, 'admin', 'quá tuyệt vời', '2018-08-17 08:32:02', 1),
(17, 1, 'nvdinh185', 'em yêu anh', '2020-09-09 04:10:26', 0),
(18, 4, 'nvdinh185', 'chờ em', '2018-08-17 08:32:02', 1),
(19, 16, 'admin', 'cho nhau lối đi riêng', '2020-10-23 07:21:39', 0),
(20, 15, 'admin', 'tìm về nhà cha', '2020-09-09 04:10:24', 0),
(21, 17, 'toquyen', 'cho nhau', '2018-09-11 04:33:30', 1),
(22, 17, 'nvdinh185', 'em yêu anh', '2018-08-17 08:43:37', 0),
(23, 17, 'huonghoa', 'mình tên là Hoa', '2018-08-17 08:44:00', 1),
(24, 3, 'nvdinh185', 'vẫn mong em quay về', '2018-09-11 06:39:58', 1),
(25, 24, 'Tố Quyên', 'em yêu anh Định', '2020-11-06 09:51:55', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `website`, `message`) VALUES
(2, 'Lâm Ngọc Khương', 'chatwithme9x@gmail.com', 'https://ngockhuong.com', 'Liên hệ admin trang'),
(3, 'Trần Văn Sơn', 'sontv@vinaenter.com', 'http://vinaenter.edu.vn', 'Liên hệ admin trang'),
(4, 'Nguyễn Văn Định', 'chatwithme9x@gmail.com', 'http://vinaenter.edu.vn', 'Liên hệ admin trang'),
(5, 'Em gái mưa', 'dinh.nguyenvan.ctv@mobifone.vn', 'http://localhost/phpmyadmin/sql.php?server=1&db=bsongs&table=rating&pos=0', 'liên hệ mới');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `granted`
--

CREATE TABLE `granted` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `addon` tinyint(4) NOT NULL,
  `edit` tinyint(4) NOT NULL,
  `del` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `granted`
--

INSERT INTO `granted` (`id`, `name`, `addon`, `edit`, `del`) VALUES
(1, 'admin', 1, 1, 1),
(2, 'editor', 1, 1, 1),
(3, 'user', 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `id_song` int(11) NOT NULL,
  `rating` float NOT NULL,
  `count` int(11) NOT NULL DEFAULT '1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `rating`
--

INSERT INTO `rating` (`id`, `id_song`, `rating`, `count`, `date`) VALUES
(1, 1, 2.42105, 19, '2020-10-22 04:04:35'),
(2, 2, 5, 2, '2020-10-22 04:04:41'),
(3, 3, 5.83333, 3, '2020-10-22 04:04:44'),
(4, 4, 5.63636, 11, '2020-10-22 04:04:49'),
(5, 5, 6.375, 4, '2020-10-22 04:04:53'),
(11, 10, 2.375, 4, '2020-10-23 04:10:39'),
(12, 18, 9.5, 1, '2020-10-22 07:01:50'),
(13, 16, 0, 1, '2020-10-23 04:25:25'),
(14, 11, 5, 2, '2020-10-23 05:07:29'),
(15, 13, 5, 2, '2020-11-04 09:41:55'),
(16, 17, 9.5, 1, '2020-11-06 09:49:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preview_text` text COLLATE utf8_unicode_ci NOT NULL,
  `detail_text` text COLLATE utf8_unicode_ci NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `picture` text COLLATE utf8_unicode_ci NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `songs`
--

INSERT INTO `songs` (`id`, `name`, `preview_text`, `detail_text`, `date_create`, `picture`, `counter`, `cat_id`) VALUES
(2, 'Cang Kho Cang Yeu cho', 'Loi bai hat Cang cho Kho Cang YeuLoi dang boi kenvip88', 'Di dau tim ra duoc mot niem tin \r\nNiem tin mai mai chang phai tan \r\nGiua thoang choc nghe nhip tim rung dong \r\nVoi nhung yeu thuong', '2020-11-04 09:17:05', 'icon-527054110534900.jpg', 25, 4),
(5, 'Em cho gái mưa', 'Mưa trôi cả bầu Trời nắng, trượt THEO những nỗi buồn \r\nThấm ướt lệ sầu môi đắng vì đánh mất hy vọng \r\nLần đầu gặp nhau dưới mưa, trái tim rộn ràng bởi enh nhìn \r\nTình cảm dầm mưa thấm lâu, em nào ngờ... ', 'Mình hợp nhau đến như vậy thế nhưng... không phải là yêu! \r\nVà em muốn hỏi anh rằng \"chúng ta là thế nào?\" \r\nRồi... lặng người đến vô tận, trách sao được sự tàn nhẫn \r\nAnh trót vô tình.. thương em như- là- em- gái... ', '2019-12-19 12:46:08', '', 16, 2),
(6, 'Đổi thay nhau', 'Mình hợp nhau đến như vậy thế nhưng... không phải là yêu! \r\nVà em muốn hỏi anh rằng \"chúng ta là thế nào?\" \r\nRồi... lặng người đến vô tận, trách sao được sự tàn nhẫn \r\nAnh trót vô tình.. thương em như- là- em- gái... ', 'Mình hợp nhau đến như vậy thế nhưng... không phải là yêu! \r\nVà em muốn hỏi anh rằng \"chúng ta là thế nào?\" \r\nRồi... lặng người đến vô tận, trách sao được sự tàn nhẫn \r\nAnh trót vô tình.. thương em như- là- em- gái... ', '2019-12-18 13:24:04', 'doi-thay.jpg', 14, 1),
(7, 'Yêu em nhiều đến thế', 'Mình hợp nhau đến như vậy thế nhưng... không phải là yêu! \r\nVà em muốn hỏi anh rằng \"chúng ta là thế nào?\" \r\nRồi... lặng người đến vô tận, trách sao được sự tàn nhẫn \r\nAnh trót vô tình.. thương em như- là- em- gái... ', 'Mình hợp nhau đến như vậy thế nhưng... không phải là yêu! \r\nVà em muốn hỏi anh rằng \"chúng ta là thế nào?\" \r\nRồi... lặng người đến vô tận, trách sao được sự tàn nhẫn \r\nAnh trót vô tình.. thương em như- là- em- gái... ', '2020-11-04 02:24:07', 'picture4-502275002568900.png', 15, 2),
(8, 'Tại sao', 'Mình hợp nhau đến như vậy thế nhưng... không phải là yêu! \r\nVà em muốn hỏi anh rằng \"chúng ta là thế nào?\" \r\nRồi... lặng người đến vô tận, trách sao được sự tàn nhẫn \r\nAnh trót vô tình.. thương em như- là- em- gái... ', 'Mình hợp nhau đến như vậy thế nhưng... không phải là yêu! \r\nVà em muốn hỏi anh rằng \"chúng ta là thế nào?\" \r\nRồi... lặng người đến vô tận, trách sao được sự tàn nhẫn \r\nAnh trót vô tình.. thương em như- là- em- gái... ', '2020-09-12 03:02:21', 'java8.jpg', 19, 2),
(9, 'Dĩ Vãng Cuộc Tình', 'Mình hợp nhau đến như vậy thế nhưng... không phải là yêu! \r\nVà em muốn hỏi anh rằng \"chúng ta là thế nào?\" \r\nRồi... lặng người đến vô tận, trách sao được sự tàn nhẫn \r\nAnh trót vô tình.. thương em như- là- em- gái... ', 'Mình hợp nhau đến như vậy thế nhưng... không phải là yêu! \r\nVà em muốn hỏi anh rằng \"chúng ta là thế nào?\" \r\nRồi... lặng người đến vô tận, trách sao được sự tàn nhẫn \r\nAnh trót vô tình.. thương em như- là- em- gái... ', '2020-10-23 04:13:31', 'java9.jpg', 23, 5),
(10, 'Nhớ để quên', 'Chẳng lẽ cứ xa nhau là không thể trở lại với nhau nữa và chẳng lẻ những kỹ niệm ngày xưa sẽ mãi trôi xa....!', '<p>Chẳng lẽ cứ xa nhau là không thể trở lại với nhau nữa và chẳng lẻ những kỹ niệm ngày xưa sẽ mãi trôi xa....!<br />\r\nPhải rồi....mới đó cũng vài năm rồi nhỉ...và giờ anh cười, cười vì anh vẫn không thể xóa tên em...<br />\r\nAnh ngốc thật nhỉ?. Mang theo yêu dấu và nỗi đau về em khi mà em đã ra đi...ước rằng hôm qua chỉ là cơn mơ để anh được mãi mơ về em và mãi không muốc thức giấc...<br />\r\n\"Thế nước mắt cứ khẽ lại rơi, nỗi đau riêng trong tim không nói nên lời. Hỡi nước mắt hỡi kỹ niệm ơn hãy cho ta một lần về phút ban đầu.....\"<br />\r\nCa từ này anh vẫn mãi không quên, anh cài từ khi hai ta hai lối. Anh vẫn sẽ nhớ, sẽ đi, đi về phía không em...</p>\r\n', '2020-10-23 07:05:48', 'java10.jpg', 50, 2),
(11, 'Only Love', 'có phải một ngày nào đó em cũng mãi xa cuộc đời tôi !\r\ncó phải tôi vẫn luôn là người ngộ nhận về một câu chuyện tình yêu tuyệt đẹp !', '<p>có phải m&ocirc;̣t ngày nào đó em cũng mãi xa cu&ocirc;̣c đời t&ocirc;i !<br />\r\ncó phải t&ocirc;i v&acirc;̃n lu&ocirc;n là người ng&ocirc;̣ nh&acirc;̣n v&ecirc;̀ m&ocirc;̣t c&acirc;u chuy&ecirc;̣n tình y&ecirc;u tuy&ecirc;̣t đẹp !<br />\r\ntrong màn đ&ecirc;m , ca từ của &quot; Only Love&quot; ng&acirc;n vang cũng chính là lúc t&acirc;m trạng b&ocirc;̀i h&ocirc;̀i và dạt dào cảm xúc với những rung đ&ocirc;̣ng v&ecirc;̣ m&ocirc;̣t người t&ocirc;i từng r&acirc;́t y&ecirc;u....!<br />\r\nchắc giờ này em đang say gi&acirc;́c n&ocirc;̀ng sau m&ocirc;̣t ngày dài hạnh phúc...à kh&ocirc;ng ! đúng hơn là em đang t&acirc;̣n hưởng m&ocirc;̣t cu&ocirc;̣c&nbsp;s&ocirc;́ng hạnh phúc với tình y&ecirc;u của mình....<br />\r\nT&ocirc;i vui, t&ocirc;i cười khi nhìn em hạnh phúc từ phía sau - m&ocirc;̣t nơi mà chẳng bao giờ em bi&ecirc;́t - &quot; nơi phía sau hạnh phúc&quot;.<br />\r\nem bi&ecirc;́t kh&ocirc;ng, từ ngày kh&ocirc;ng còn gặp em nữa , cu&ocirc;̣c s&ocirc;́ng của anh thay đ&ocirc;̃i r&acirc;́t nhi&ecirc;̀u. Anh kh&ocirc;ng còn nghẹn ngào, b&ocirc;́i r&ocirc;́i khi th&acirc;́y em b&ecirc;n người &acirc;́y nữa, cũng kh&ocirc;ng còn từng đ&ecirc;m nhớ v&ecirc;̀ hình ảnh của em, của những kỹ ni&ecirc;̣m ngày ta còn c&acirc;́p sách đ&ecirc;́n trường. Trong anh giờ chỉ còn ký ức - m&ocirc;̣t ký ức v&ecirc;̀ m&ocirc;́i tình đ&acirc;̀u kh&ocirc;ng phai.<br />\r\ntừ khi xa em, anh đã thử r&acirc;́t nhi&ecirc;̀u cách đ&ecirc;̉ qu&ecirc;n em: &quot; Anh lao vào c&ocirc;ng vi&ecirc;̣c, vào vi&ecirc;̣c học và hơn cả anh đã ép bản th&acirc;n y&ecirc;u m&ocirc;̣t người con gái khác với hy vọng xóa được hình ảnh của em...&quot; Nhưng em à! giờ anh nh&acirc;̣n ra đi&ecirc;̀u đó là kh&ocirc;ng th&ecirc;̉...!!!<br />\r\nCu&ocirc;̣c s&ocirc;́ng b&ocirc;̣n b&ecirc;̀ với những lo toan kh&ocirc;ng th&ecirc;̉ khi&ecirc;́n anh qu&ecirc;n em, khi y&ecirc;u người con gái khác anh lại chỉ th&acirc;́y hình ảnh của em nhi&ecirc;̀u hơn....Anh ng&ocirc;́c lắm phải kh&ocirc;ng! khi bi&ecirc;́t được có người con trai khác t&ocirc;́t hơn anh y&ecirc;u em anh đã đ&acirc;̀u hàng và chúc phúc cho hai người....Th&acirc;̣t sự giờ nghỉ lại lúc đó anh th&acirc;́y mình r&acirc;́t hèn và y&ecirc;́u đu&ocirc;́i<br />\r\nnhưng n&ecirc;́u anh được quay lại lúc đó thì anh v&acirc;̃n sẽ hành đ&ocirc;̣ng như v&acirc;̣y, em bi&ecirc;́t vì sao kh&ocirc;ng ? vì Anh y&ecirc;u Em.<br />\r\nVà anh v&acirc;̃n tin sẽ có ngày chúng ta gặp lại nhau, cười nói vui đùa cùng nhau như hai người bạn th&acirc;n của ngày trước.....<br />\r\nphải kh&ocirc;ng em - người lạ từng quen !</p>\r\n', '2020-10-23 07:03:38', 'only-love.jpg', 29, 1),
(12, 'Khó', 'Mình hợp nhau đến như vậy thế nhưng... không phải là yêu! \r\nVà em muốn hỏi anh rằng \"chúng ta là thế nào?\" \r\nRồi... lặng người đến vô tận, trách sao được sự tàn nhẫn \r\nAnh trót vô tình.. thương em như- là- em- gái... ', 'Mình hợp nhau đến như vậy thế nhưng... không phải là yêu! \r\nVà em muốn hỏi anh rằng \"chúng ta là thế nào?\" \r\nRồi... lặng người đến vô tận, trách sao được sự tàn nhẫn \r\nAnh trót vô tình.. thương em như- là- em- gái... ', '2019-12-18 14:54:00', 'java12.jpg', 23, 7),
(13, 'Bay giữa ngân hà', 'Mình hợp nhau đến như vậy thế nhưng... không phải là yêu! \r\nVà em muốn hỏi anh rằng \"chúng ta là thế nào?\" \r\nRồi... lặng người đến vô tận, trách sao được sự tàn nhẫn \r\nAnh trót vô tình.. thương em như- là- em- gái... ', 'Mình hợp nhau đến như vậy thế nhưng... không phải là yêu! \r\nVà em muốn hỏi anh rằng \"chúng ta là thế nào?\" \r\nRồi... lặng người đến vô tận, trách sao được sự tàn nhẫn \r\nAnh trót vô tình.. thương em như- là- em- gái... ', '2020-11-04 09:41:46', 'java13.jpg', 53, 7),
(14, 'Chọn Giê su thôi', 'Mình hợp nhau đến như vậy thế nhưng... không phải là yêu! \r\nVà em muốn hỏi anh rằng \"chúng ta là thế nào?\" \r\nRồi... lặng người đến vô tận, trách sao được sự tàn nhẫn \r\nAnh trót vô tình.. thương em như- là- em- gái... ', 'Mình hợp nhau đến như vậy thế nhưng... không phải là yêu! \r\nVà em muốn hỏi anh rằng \"chúng ta là thế nào?\" \r\nRồi... lặng người đến vô tận, trách sao được sự tàn nhẫn \r\nAnh trót vô tình.. thương em như- là- em- gái... ', '2020-11-04 09:14:18', 'java14.jpg', 56, 6),
(16, 'cho nhau loi di rieng', 'Xin giấu con Nơi cánh tay Cha Che phủ con Nhờ bóng Thiên Cha quyền năng ', 'Dù giông tố khiếp kinh, sóng gió vây quanh Nguyện xin Chúa dắt đưa vượt qua bão tố Lạy ha Thánh hiển vinh, Vua trên dương gian Con uôn vững lòng vì biết Cha bên con ', '2020-11-06 09:48:22', 'doi-thay-701741652086000.jpg', 69, 2),
(17, 'Cho đến mãi mãi', 'Gai đâm thấu buốt nơi trán Giê-su Bao nhiêu ủa sả chất hết trên Ngài Lằn roi chứng minh ho cả thế giới Ngài yêu con đến nỗi chết thay con', 'Cha đã xóa hết tất cả lỗi lầm Giê-su chết thế công lý đã trọn Vì Ngài quá yêu bằng \r\n lòng hy sinh Nguyện xin Thánh ý của Cha được trọn', '2020-11-06 09:49:02', 'java17.jpg', 105, 6),
(18, 'Vua chí ái', 'Gai đâm thấu buốt nơi trán Giê-su Bao nhiêu ủa sả chất hết trên Ngài Lằn roi chứng minh ho cả thế giới Ngài yêu con đến nỗi chết thay con', 'Cha đã xóa hết tất cả lỗi lầm Giê-su chết thế công lý đã trọn Vì Ngài quá yêu bằng \r\n lòng hy sinh Nguyện xin Thánh ý của Cha được trọn', '2020-11-06 09:21:30', 'java18.jpg', 114, 6),
(22, 'Vững an', '111', '111', '2020-11-06 09:44:49', 'picture4-701526479154800.png', 0, 6),
(23, 'Dù con ra sao Chúa vẫn yêu', '222', '222', '2020-11-06 09:51:01', 'icon-701565719069700.jpg', 1, 6),
(24, 'Dâng lên Chúa lời ngợi ca', '333', '333', '2020-11-06 09:51:16', 'background-701605389754300.jpg', 3, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`, `role`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'Administrator', 1),
(2, 'dinh', '202cb962ac59075b964b07152d234b70', 'Nguyễn Văn Định', 2),
(5, 'manhme', '202cb962ac59075b964b07152d234b70', 'Đinh Công Mạnh', 3),
(6, 'nvdinh185', '202cb962ac59075b964b07152d234b70', 'Nguyễn Văn Định', 3),
(7, 'toquyen', '202cb962ac59075b964b07152d234b70', 'Tố Quyên', 3),
(8, 'huonghoa', 'e10adc3949ba59abbe56e057f20f883e', 'huong', 3),
(9, 'user', '202cb962ac59075b964b07152d234b70', 'Người dùng bình thường', 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`,`name`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `granted`
--
ALTER TABLE `granted`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`,`cat_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `granted`
--
ALTER TABLE `granted`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `granted` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
