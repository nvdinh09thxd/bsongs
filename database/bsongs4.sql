-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 23, 2020 lúc 02:17 PM
-- Phiên bản máy phục vụ: 10.1.32-MariaDB
-- Phiên bản PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bsongs4`
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
(3, 'Nhạc thiếu nhi'),
(4, 'Nhạc Pop'),
(5, 'Nhạc Rock'),
(6, 'Nhạc Đỏ'),
(7, 'Nhạc Remix');

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
(1, 'Lâm Ngọc Khương', 'chatwithme9x@gmail.com', 'https://ngockhuong.com', 'Liên hệ admin trang Liên hệ admin trang Liên hệ admin trangLiên hệ admin trangLiên hệ admin trangLiên hệ admin trangLiên hệ admin trang Liên hệ admin trang Liên hệ admin trang Liên hệ admin trang Liên hệ admin trang Liên hệ admin trang Liên hệ admin trang Liên hệ admin trang Liên hệ admin trang Liên hệ admin trang'),
(2, 'Lâm Ngọc Khương', 'chatwithme9x@gmail.com', 'https://ngockhuong.com', 'Liên hệ admin trang'),
(3, 'Trần Văn Sơn', 'sontv@vinaenter.com', 'http://vinaenter.edu.vn', 'Liên hệ admin trang'),
(4, 'Hoa Hồng', 'chatwithme9x@gmail.com', 'http://vinaenter.edu.vn', 'Liên hệ admin trang'),
(9, 'Định', 'admin@gmail.com', 'https://www.google.com/', 'liên hệ mới thêm'),
(10, 'Định', 'nvdinh0766777123@gmail.com', 'https://www.google.com/', 'đây là liên hệ'),
(11, 'Định', 'admin@gmail.com', 'https://www.google.com/', 'liên hệ mới thêm'),
(12, 'Nam', 'nvdinh0766777123@gmail.com', 'https://www.google.com/', 'liên hệ của Nam');

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
(1, 'Nơi Ấy Con Tìm Về', 'Cũng đã một tuần trôi qua,...nhanh thật!. Ngày nào còn ở nhà chỉ ăn học và vui chơi nhưng giờ con đã nhập ngũ...!\r\nThật sự giờ đây con rất nhớ nhà, nhớ ba, nhớ mẹ, và đặc biệt con rất nhớ ngoại...không biết giờ này ngoại ra sao? ngoại có ăn uống bình thường không?....khuya này trời mưa, không biết ngoại có đau nhức nữa không?...', '<p>Cũng đã m&ocirc;̣t tu&acirc;̀n tr&ocirc;i qua,...nhanh th&acirc;̣t!. Ngày nào còn ở nhà chỉ ăn học và vui chơi nhưng giờ con đã nh&acirc;̣p ngũ...!<br />\r\nTh&acirc;̣t sự giờ đ&acirc;y con r&acirc;́t nhớ nhà, nhớ ba, nhớ mẹ, và đặc bi&ecirc;̣t con r&acirc;́t nhớ ngoại...kh&ocirc;ng bi&ecirc;́t giờ này ngoại ra sao? ngoại có ăn u&ocirc;́ng bình thường kh&ocirc;ng?....khuya này trời mưa, kh&ocirc;ng bi&ecirc;́t ngoại có đau nhức nữa kh&ocirc;ng?...<br />\r\nbi&ecirc;́t bao nhi&ecirc;u c&acirc;u hỏi và sự lo lắng th&ecirc;́ nhưng con v&acirc;̃n&nbsp;kh&ocirc;ng qu&ecirc;n nhi&ecirc;̣m vụ của mình. Từ khi nh&acirc;̣p ngũ con mới hi&ecirc;̉u cảm giác thi&ecirc;́u th&ocirc;́n tình cảm gia đình. Con còn nhớ h&ocirc;m trước lúc con l&ecirc;n đường mẹ đã vào phòng con đ&ecirc;̉ nhìn con ngủ và mẹ đã khóc nhi&ecirc;̀u lắm...mẹ bi&ecirc;́t kh&ocirc;ng? lúc đó con v&acirc;̃n thức nhưng kh&ocirc;ng bi&ecirc;́t nói gì...! lúc đó con mới hi&ecirc;̉u mẹ thương con đ&ecirc;́n mức nào...!!!</p>\r\n\r\n<p>Tu&ocirc;̉i thơ con gắn li&ecirc;̀n với Ngoại, từ lúc nhỏ đ&ecirc;́n lớn con lu&ocirc;n có Ngoại b&ecirc;n cạnh, lo cho con từng mi&ecirc;́ng ăn, gi&acirc;́c ngủ, cũng như nu&ocirc;i lớn, dạy d&ocirc;̃ con n&ecirc;n người. Giờ Ngoại đã lớn tu&ocirc;̉i và cũng kh&ocirc;ng khỏe mạnh như xưa...con thương Ngoại nhi&ecirc;̀u lắm...Ngày con đi, Ngoại kh&ocirc;ng nói gì nhưng hai hàng l&ecirc;̣ Ngoại v&acirc;̃n rơi...!!!</p>\r\n\r\n<p>V&ecirc;̀ ph&acirc;̀n Ba, Ba chỉ đ&ocirc;̣ng vi&ecirc;n con sớm hoàn thành t&ocirc;́t nhi&ecirc;̣m vụ r&ocirc;̀i v&ecirc;̀. Nhưng con bi&ecirc;́t, ba lo cho con nhi&ecirc;̀u hơn th&ecirc;́...phải kh&ocirc;ng Ba?...</p>\r\n\r\n<p>Ngày còn ở nhà con đã kh&ocirc;ng tr&acirc;n trọng khoản thời gian đó n&ecirc;n giờ con mới th&acirc;̣t sự h&ocirc;́i h&acirc;̣n, m&ocirc;̣t sự h&ocirc;́i h&acirc;̣n mu&ocirc;̣n màng...! từ lúc nh&acirc;̣p ngũ, con cảm nh&acirc;̣n v&ecirc;̀ cu&ocirc;̣c s&ocirc;́ng nhi&ecirc;̀u hơn, thương gia đình mình nhi&ecirc;̀u hơn<br />\r\nCon tự hứa với lòng, con phải hoàn thành t&ocirc;́t mọi nhi&ecirc;̣m vụ được giao đ&ecirc;̉ khi ra qu&acirc;n con sẽ s&ocirc;́ng th&acirc;̣t t&ocirc;́t, s&ocirc;́ng trọn vẹn từng phút gi&acirc;y với gia đình mình vì con kh&ocirc;ng mu&ocirc;́n phải th&ecirc;m m&ocirc;̣t l&acirc;̀n h&ocirc;́i h&acirc;̣n nữa...</p>\r\n\r\n<p>Cả nhà ơi...Đợi con nhé...!</p>\r\n\r\n<p><a href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fmp3.zing.vn%2Fbai-hat%2FNoi-Ay-Con-Tim-Ve-Ho-Quang-Hieu%2FZW6A7F6F.html&amp;h=ATP_DCkNRbbSu8RP-f-8meMv4zNDsK9RoluK692H_FpdU49URiS9XjezQHanbJ0AaX4Jv2hgwnRbqfTkwAIi0I3a96DE1xIm2cI1VB5m0shUU0GhM_C_NPv1M_JioW1F11Jhpm3yuZ7D2NhN_i-8tuGYiw&amp;enc=AZNES1mZ6gULShcvUSomVl9dhveqpYPr5EL7aqGPgEyeHkPkWUKfqlFyr0k4TEMHDu3IuQvV4NeB4NlOPk7XiBhu226kRIevrWEpukxCqh1pTOQFLlf2Ra5_5uvZhFmI3N716k4FH7SdJl0gnPbryGf--wytg6uZJ4rV4vEhdxOj8C7EOAI9AwTXarfp54Hf3WrSNXSnYASu33skgj28BnQ0&amp;s=1\" onclick=\"LinkshimAsyncLink.referrer_log(this, &quot;http:\\/\\/mp3.zing.vn\\/bai-hat\\/Noi-Ay-Con-Tim-Ve-Ho-Quang-Hieu\\/ZW6A7F6F.html&quot;, &quot;\\/si\\/ajax\\/l\\/render_linkshim_log\\/?u=http\\u00253A\\u00252F\\u00252Fmp3.zing.vn\\u00252Fbai-hat\\u00252FNoi-Ay-Con-Tim-Ve-Ho-Quang-Hieu\\u00252FZW6A7F6F.html&amp;h=ATP_DCkNRbbSu8RP-f-8meMv4zNDsK9RoluK692H_FpdU49URiS9XjezQHanbJ0AaX4Jv2hgwnRbqfTkwAIi0I3a96DE1xIm2cI1VB5m0shUU0GhM_C_NPv1M_JioW1F11Jhpm3yuZ7D2NhN_i-8tuGYiw&amp;enc=AZNES1mZ6gULShcvUSomVl9dhveqpYPr5EL7aqGPgEyeHkPkWUKfqlFyr0k4TEMHDu3IuQvV4NeB4NlOPk7XiBhu226kRIevrWEpukxCqh1pTOQFLlf2Ra5_5uvZhFmI3N716k4FH7SdJl0gnPbryGf--wytg6uZJ4rV4vEhdxOj8C7EOAI9AwTXarfp54Hf3WrSNXSnYASu33skgj28BnQ0&amp;d&quot;);\" rel=\"nofollow noopener\" target=\"_blank\">http://mp3.zing.vn/&hellip;/Noi-Ay-Con-Tim-Ve-Ho-Qua&hellip;/ZW6A7F6F.html</a></p>\r\n\r\n<p>&quot;Ng&agrave;y con cất tiếng kh&oacute;c ch&agrave;o đời&nbsp;<br />\r\nNg&agrave;y mẹ đ&atilde; n&oacute;i niềm vui tr&agrave;o d&acirc;ng ngập trời.&nbsp;<br />\r\nBằng y&ecirc;u thương của cha đ&atilde; d&agrave;nh,&nbsp;<br />\r\nđể trong m&aacute;i ấm từng ng&agrave;y qua con lớn l&ecirc;n.&nbsp;<br />\r\nL&agrave; lời ru mẹ đưa b&ecirc;n c&aacute;nh v&otilde;ng cho con say&nbsp;<br />\r\ngiấc ngủ,&nbsp;<br />\r\nl&agrave; lời cha từng ng&agrave;y ấm &ecirc;m mong sao cho con n&ecirc;n người.&nbsp;<br />\r\nThời gian lấy đi m&ugrave;a xu&acirc;n của mẹ,v&agrave; con lấy đi sức sống mẹ cha.&nbsp;<br />\r\nĐK:&nbsp;<br />\r\nCuộc đời con sẽ kh&ocirc;ng qu&ecirc;n&nbsp;<br />\r\nt&igrave;nh y&ecirc;u thương mẹ cha đ&atilde; d&agrave;nh cho con người ơi, t&igrave;nh y&ecirc;u bao la,&nbsp;<br />\r\ntheo con như như c&acirc;u ru xưa cho vơi đi nỗi nhọc nhằn trong đời của người.&nbsp;<br />\r\nĐường tương lai nhiều ch&ocirc;ng gai v&agrave; những l&uacute;c gian nan l&agrave;m con ng&atilde; quỵ,&nbsp;<br />\r\nđể con nhớ rằng nơi ấy một g&oacute;c b&igrave;nh y&ecirc;n lu&ocirc;n c&oacute; mẹ cha chờ con t&igrave;m về...&quot;</p>\r\n', '2020-10-21 14:27:51', 'doi-thay.jpg', 2, 4),
(2, 'Càng Khó Càng Yêu', '\"Nhớ lắm Tặng a món quà tinh thần ... \r\n01.04 Ngày kĩ niệm :x \r\nDù ngày mai đời đổi thay \r\nChỉ yêu anh và yêu thôi, \r\nNguyện yêu mãi muôn đời chẳng quên\"', '<p>&quot;Nhớ lắm Tặng a m&oacute;n qu&agrave; tinh thần ...&nbsp;<br />\r\n01.04 Ng&agrave;y kĩ niệm :x&nbsp;<br />\r\nD&ugrave; ng&agrave;y mai đời đổi thay&nbsp;<br />\r\nChỉ y&ecirc;u anh v&agrave; y&ecirc;u th&ocirc;i,&nbsp;<br />\r\nNguyện y&ecirc;u m&atilde;i mu&ocirc;n đời chẳng qu&ecirc;n&quot;</p>\r\n\r\n<p>Đ&acirc;y là những lời tự đáy lòng của m&ocirc;̣t c&ocirc; gái có người y&ecirc;u đang thực hi&ecirc;̣n nghĩa vụ bảo v&ecirc;̣ đ&acirc;́t nước</p>\r\n\r\n<p>Là người chứng ki&ecirc;́n hai bạn từ lúc mới quen đ&ecirc;́n t&acirc;̣n b&acirc;y giờ, kh&ocirc;ng bi&ecirc;́t đã trãi qua bi&ecirc;́t bao nhi&ecirc;u l&acirc;̀n vui, bu&ocirc;̀n, gi&acirc;̣n dõi,... Th&ecirc;́ nhưng hai bạn v&acirc;̃n b&ecirc;n nhau kh&ocirc;ng xa rời. Bởi vì đó gọi là &quot;Tình Y&ecirc;u&quot;</p>\r\n', '2020-10-21 14:55:27', 'noi-ay-con-tim-ve.jpg', 12, 4),
(3, 'Vẫn Mong Chờ', 'Vẫn như mọi đêm, anh ngồi đây bên cạnh là chiếc điện thoại và những dòng tin nhắn cũ. Cũng lâu rồi em nhỉ...à phải rồi...cũng gần 3 năm chúng ta không gặp nhau rồi còn gì....!', '<p>V&acirc;̃n như mọi đ&ecirc;m, anh ng&ocirc;̀i đ&acirc;y b&ecirc;n cạnh là chi&ecirc;́c đi&ecirc;̣n thoại và những dòng tin nhắn cũ. Cũng l&acirc;u r&ocirc;̀i em nhỉ...à phải r&ocirc;̀i...cũng g&acirc;̀n 3 năm chúng ta kh&ocirc;ng gặp nhau r&ocirc;̀i còn gì....!<br />\r\n3 năm...kh&ocirc;ng dài nhưng cũng chẳng ngắn. anh kh&ocirc;ng bi&ecirc;́t em có còn nhớ anh, nhớ những ký ức của ngày xưa kh&ocirc;ng? nhưng với anh, hằng đ&ecirc;m v&acirc;̃n đọc lại những dòng tin nhắn ta đã nhắn cho nhau, r&ocirc;̀i khẽ mỉm cười hạnh phúc...cứ như anh v&acirc;̃n đang nhắn tin với em nư ngày xưa v&acirc;̣y...!</p>\r\n\r\n<p>Em bi&ecirc;́t kh&ocirc;ng! m&ocirc;̃i ngày tr&ocirc;i qua với anh dù cho có khó khăn, v&acirc;́t vã, áp lực đ&ecirc;́n đ&acirc;u đi nữa thì anh v&acirc;̃n c&ocirc;́ gắng vượt qua t&acirc;́t cả vì anh bi&ecirc;́t rằng: &quot;anh đã y&ecirc;u, đang y&ecirc;u và sẽ mãi y&ecirc;u m&ocirc;̣t người đó là em...&quot;. Ngày đó anh v&acirc;̃n còn nhớ r&acirc;́t rõ khi ta gặp nhau l&acirc;̀n đ&acirc;̀u ti&ecirc;n, đó là ngày nh&acirc;̣p học đ&acirc;̀u ti&ecirc;n của năm lớp 9. Lúc &acirc;́y với anh em chỉ là m&ocirc;̣t c&ocirc; bạn mới quen vừa hòa đ&ocirc;̀ng vừa th&acirc;n thi&ecirc;̣n và đặc bi&ecirc;̣t là nụ cười mà đ&ecirc;́n giờ anh v&acirc;̃n kh&ocirc;ng qu&ecirc;n được. Những ngày tháng học chung với em tuy cu&ocirc;̣c s&ocirc;́ng anh có nhi&ecirc;̀u bi&ecirc;́n c&ocirc;́ và nhi&ecirc;̀u chuy&ecirc;̣n kh&ocirc;ng vui trong gia đình cũng như học t&acirc;̣p, th&ecirc;́ nhưng sự xu&acirc;́t hi&ecirc;̣n của em đã khi&ecirc;́n anh th&ecirc;m ý chí và ni&ecirc;̀m vui trong cu&ocirc;̣c s&ocirc;́ng. em còn nhớ kh&ocirc;ng, anh từng vì em mà l&acirc;̀n đ&acirc;̀u ti&ecirc;n đứng ra cản thằng cá bi&ecirc;̣t nh&acirc;́t lớp khi nó ghẹo em; cũng có l&acirc;̀n vì em anh phan cả đ&ocirc;i giày của mình cho thằng cứ theo d&ecirc; em hoài...ha ha...nhớ lại ngày đó anh cũng trẻ con th&acirc;̣t...</p>\r\n\r\n<p>L&ecirc;n c&acirc;́p 3, tuy anh và em v&acirc;̃n học chung trường nhưng lại khác lớp. đ&acirc;y cũng là giai đoạn anh bi&ecirc;́t anh đã y&ecirc;u em nhi&ecirc;̀u như th&ecirc;́ nào...nhưng cũng là giai đoạn anh đau kh&ocirc;̉ vì em nhi&ecirc;̀u nh&acirc;́t...nhưng th&ocirc;i...anh chỉ mu&ocirc;́n nhớ những kỷ ni&ecirc;̣m đẹp v&ecirc;̀ em th&ocirc;i, còn những n&ocirc;̃i đau anh gửi gió cu&ocirc;́n đi h&ecirc;́t r&ocirc;̀i...vì anh bi&ecirc;́t : &quot;tình y&ecirc;u phải trãi qua sóng gió, phải xa nhau, phải đau kh&ocirc;̉ thì mới có được hạnh phúc, ni&ecirc;̀m vui trọn vẹn phải kh&ocirc;ng em&quot;.</p>\r\n\r\n<p>&ldquo; Rồi đ&ocirc;i ta xa nhau tr&ecirc;n đường về vắng em&nbsp;<br />\r\nTừng l&agrave;n m&acirc;y vẫn tr&ocirc;i như ng&agrave;y xưa kỷ niệm&nbsp;<br />\r\nTr&ecirc;n những cung đ&agrave;n xưa vấn vương nổi buồn n&agrave;o&nbsp;<br />\r\nM&agrave; b&agrave;i ca t&igrave;nh y&ecirc;u, giờ đ&acirc;y đ&agrave;nh dang dỡ&nbsp;<br />\r\nD&ograve;ng thời gian tr&ocirc;i nhanh, anh vẫn chờ b&oacute;ng em&nbsp;<br />\r\nĐường về 2 h&igrave;nh b&oacute;ng nay sao chỉ 1 m&igrave;nh&nbsp;<br />\r\nBước ch&acirc;n đi m&igrave;nh anh, c&ocirc; đơn trong lặng thầm&nbsp;<br />\r\nGọi t&ecirc;n em anh chờ 1 h&igrave;nh dung&nbsp;<br />\r\nĐk:&nbsp;<br />\r\nC&oacute; lẽ trong m&agrave;n đ&ecirc;m c&agrave;ng l&agrave;m anh nhớ em&nbsp;<br />\r\nC&oacute; lẽ em b&acirc;y giờ đang vui b&ecirc;n hạnh ph&uacute;c mới&nbsp;<br />\r\nKh&oacute;e m&ocirc;i anh lại gọi thầm t&ecirc;n của em th&ocirc;i&nbsp;<br />\r\nNhững t&igrave;nh y&ecirc;u ng&agrave;y xưa, bao ng&agrave;y qua vẫn giữ nguy&ecirc;n&nbsp;<br />\r\nNước mắt anh bao đ&ecirc;m, cứ lặng thầm khẽ rơi&nbsp;<br />\r\nNhớ mong em từng ng&agrave;y tr&ecirc;n đường anh vẫn bước&nbsp;<br />\r\nTr&aacute;i tim anh chờ mong khi cơn mưa ngừng rơi&nbsp;<br />\r\nTa sẽ b&ecirc;n cạnh nhau, v&agrave; y&ecirc;u lại từ đầu..&rdquo;</p>\r\n\r\n<p><br />\r\nAnh kh&ocirc;ng bi&ecirc;́t em còn nhớ lời hứa ngày đó với anh hay kh&ocirc;ng?. Có th&ecirc;̉ em đã qu&ecirc;n lời hứa đó và đã có người y&ecirc;u, có người y&ecirc;u thương chăm sóc...Th&ecirc;́ nhưng anh v&acirc;̃n kh&ocirc;ng ngừng hy vọng, kh&ocirc;ng ngừng đặt ni&ecirc;̀m tin vào em...vì anh bi&ecirc;́t rằng &quot;trái tim anh mu&ocirc;́n gì...&quot; Hãy đợi anh em nhé...vì chỉ còn khoản 3 tháng nữa th&ocirc;i là anh sẽ được gặp lại em r&ocirc;̀i...anh th&acirc;̣t sự r&acirc;́t mong chờ ngay &acirc;́y sẽ đ&ecirc;́n, khi đó anh sẽ chạy đ&ecirc;́n và &ocirc;m chằm l&acirc;́y em th&acirc;̣t chặt đ&ecirc;̉ em mãi kh&ocirc;ng rời xa anh....th&ecirc;́ nhưng cũng có th&ecirc;̉ khi anh gặp em thì em đã tay trong tay với người con trai khác...!!! chắc lúc đó anh sẽ bu&ocirc;̀n lắm, tuy&ecirc;̣t vọng lắm, mu&ocirc;́n khóc lắm...! nhưng em đừng lo, n&ecirc;́u đi&ecirc;̀u &acirc;́y xãy ra anh sẽ c&ocirc;́ gắng tươi cười và chúc phúc cho em, anh sẽ kh&ocirc;ng khóc trước mặt em đ&acirc;u...vì anh kh&ocirc;ng mu&ocirc;́n em phải bu&ocirc;̀n vì anh....</p>\r\n\r\n<p>Đợi anh em nhé, dù ý nghĩa của sự chờ mong là tình y&ecirc;u hay tình bạn thì anh v&acirc;̃n v&acirc;̣y, v&acirc;̃n là anh của ngày nào...em nhé !</p>\r\n\r\n<p>SP.<br />\r\n<a href=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fmp3.zing.vn%2Fbai-hat%2FVan-Cho-Mong-Tan-Khanh%2FZWZDDF6E.html&amp;h=ATMon4oAHiclnG8QJAVparnJZCgvzaTzkRiPoL4v4OcsY5mas5CHJqaAe414JEtj-0crhHtVMK86CKrQyCZSmMWtPygC9yv9zDJYqAPpmrPDcQORHTbIoVvWkNQoJmjTIG5dLInDPIU3jsHtstKO5L0F-A&amp;enc=AZPZxTF7dDT0Lyscloc8OX6LY-mPQht5iTE-IwPkuIWe4iBK3GhADlkpLrcWX7aE7dMCD6_UgFVoC62E2HvnG3dtywE99gbzAEz7PxGToJR6gaK90yq__hhu8uniUWUQEQUHgvMvnaPEr-h4utK-mBQcc_amotl7UVYxIhNIrf1D08xSXLd0kIVKyGzI4rERG0vlyAosFgk4b3OEIQyUsODR&amp;s=1\" onclick=\"LinkshimAsyncLink.referrer_log(this, &quot;http:\\/\\/mp3.zing.vn\\/bai-hat\\/Van-Cho-Mong-Tan-Khanh\\/ZWZDDF6E.html&quot;, &quot;\\/si\\/ajax\\/l\\/render_linkshim_log\\/?u=http\\u00253A\\u00252F\\u00252Fmp3.zing.vn\\u00252Fbai-hat\\u00252FVan-Cho-Mong-Tan-Khanh\\u00252FZWZDDF6E.html&amp;h=ATMon4oAHiclnG8QJAVparnJZCgvzaTzkRiPoL4v4OcsY5mas5CHJqaAe414JEtj-0crhHtVMK86CKrQyCZSmMWtPygC9yv9zDJYqAPpmrPDcQORHTbIoVvWkNQoJmjTIG5dLInDPIU3jsHtstKO5L0F-A&amp;enc=AZPZxTF7dDT0Lyscloc8OX6LY-mPQht5iTE-IwPkuIWe4iBK3GhADlkpLrcWX7aE7dMCD6_UgFVoC62E2HvnG3dtywE99gbzAEz7PxGToJR6gaK90yq__hhu8uniUWUQEQUHgvMvnaPEr-h4utK-mBQcc_amotl7UVYxIhNIrf1D08xSXLd0kIVKyGzI4rERG0vlyAosFgk4b3OEIQyUsODR&amp;d&quot;);\" rel=\"nofollow noopener\" target=\"_blank\">http://mp3.zing.vn/bai&hellip;/Van-Cho-Mong-Tan-Khanh/ZWZDDF6E.html</a></p>\r\n', '2020-10-23 11:13:21', 'only-love.jpg', 6, 2),
(4, 'Chờ em', 'chờ em, chờ những kỹ niệm hay chờ những niềm đau !!!.', '<p>chờ em, chờ những kỹ ni&ecirc;̣m hay chờ những ni&ecirc;̀m đau !!!.<br />\r\nNhững đ&ecirc;m thức trắng như h&ocirc;m nay anh v&acirc;̃n làm c&ocirc;ng vi&ecirc;̣c cũ....đó là Chờ em......<br />\r\nEm bi&ecirc;́t kh&ocirc;ng, đ&ecirc;m nay anh đã nghe m&ocirc;̣t bản nhạc r&acirc;́t hay, hay lắm. Anh nghe và hát theo lời có sẵn, nhưng.....chỉ hát được nữa bài thì anh ngừng hát theo.....vì sao em bi&ecirc;́t kh&ocirc;ng !!!.....vì .....nước mắt anh đang rơi.........<br />\r\n&quot;Mơ từng chiều về để hồn vẫn mơ<br />\r\nH&igrave;nh b&oacute;ng chưa phai mờ theo năm th&aacute;ng<br />\r\nD&ugrave; người đ&atilde; đi về nơi phương xa<br />\r\nĐể giờ đ&acirc;y con tim cứ ứơc mơ, cứ ng&oacute;ng chờ<br />\r\nH&agrave;ng c&acirc;y nghi&ecirc;ng lao xao c&aacute;nh chim ơi c&ograve;n bay về chốn nao</p>\r\n\r\n<p>Đau, ng&agrave;y vội t&agrave;n để đời m&atilde;i đau<br />\r\nTừng ph&uacute;t tr&ocirc;i qua chờ trong nỗi nhớ<br />\r\nDẫu trong ta cuộc t&igrave;nh đ&atilde; lỡ<br />\r\nNgười ơi khi n&agrave;o cho ta<br />\r\nThời gian ko bu&ocirc;ng tha để cho ta chờ em m&atilde;i th&ocirc;i</p>\r\n\r\n<p>Kh&ocirc;ng gian bao la đường về chiếc b&oacute;ng c&ocirc; đơn m&igrave;nh ta bước<br />\r\nĐ&ocirc;i ch&acirc;n đau thương ch&ocirc;ng gai ch&aacute;y s&aacute;ng l&ecirc;n tr&ecirc;n đời ta<br />\r\nKhi xưa b&ecirc;n em l&ograve;ng ta vui mỗi khi em cười<br />\r\nGiờ c&ograve;n lại g&igrave; nh&igrave;n quanh chỉ nỗi đau th&ocirc;i</p>\r\n\r\n<p>Tr&oacute;t y&ecirc;u em l&agrave; anh trọn đời m&atilde;i thương nhớ<br />\r\nKhi con tim b&acirc;y giờ vẫn lu&ocirc;n lu&ocirc;n mong chờ<br />\r\nD&ugrave; hai ta c&aacute;ch xa<br />\r\nCầu mong 1 ng&agrave;y cho ta nghe tiếng em<br />\r\nTrở về cho đời ta th&ocirc;i đ&acirc;u ng&agrave;y th&aacute;ng<br />\r\nNgười y&ecirc;u hỡi xin quay về nơi đ&acirc;y.</p>\r\n\r\n<p>Anh chờ em trọn đời đến mu&ocirc;n kiếp...<br />\r\nCầu mong một ng&agrave;y cho ta nghe tiếng em<br />\r\nTrở về cho ta th&ocirc;i đau v&igrave; nhớ<br />\r\nNgười y&ecirc;u ơi anh sẽ c&ograve;n chờ em......&quot;</p>\r\n\r\n<p>Anh cứ nghĩ đ&acirc;y là bài hát dành ri&ecirc;ng cho anh v&acirc;̣y.....Anh ng&ocirc;́c lắm phải kh&ocirc;ng? vì cứ mãi chờ m&ocirc;̣t người kh&ocirc;ng quay v&ecirc;̀.............!!!!!</p>\r\n\r\n<p>em giờ đã có cu&ocirc;̣c s&ocirc;́ng ri&ecirc;ng, có người y&ecirc;u và đang r&acirc;́t hạnh phúc nhỉ...!! Anh kh&ocirc;ng bi&ecirc;́t nữa vì đó chỉ là những suy đoán của ri&ecirc;ng anh mà th&ocirc;i. Còn anh....anh v&acirc;̃n như ngày nào; v&acirc;̃n là chàng ng&ocirc;́c m&ocirc;̃i l&acirc;̀n chạy xe ngang qua con hẻm vào nhà em là lại nhìn vào...., v&acirc;̃n là chàng ng&ocirc;́c l&ecirc;n face chỉ lặng lẻ vào face của em đ&ecirc;̉ bi&ecirc;́t em hi&ecirc;̣n như th&ecirc;́ nào....., v&acirc;̃n là chàng ng&ocirc;́c thức tới khuya nghe nhạc r&ocirc;̀i nhớ v&ecirc;̀ những kỹ ni&ecirc;̣m đã cùng có với em....., v&acirc;̃n là chàng ng&ocirc;́c từ ch&ocirc;́i tình cảm những c&ocirc; gái khác vì v&acirc;̃n nhớ em.....!!!!!!</p>\r\n\r\n<p>ng&ocirc;́c.....ng&ocirc;́c.....ng&ocirc;́c.....!!!! Đó có lẻ là từ thích hợp nh&acirc;́t đ&ocirc;́i với tình cảm anh dành cho em......Em bi&ecirc;́t kh&ocirc;ng, ngày đó khi em nhắn anh đừng làm phi&ecirc;̀n cu&ocirc;̣c s&ocirc;́ng của em nữa.......anh đau lắm. Đ&ecirc;́n khi em ch&acirc;́p nh&acirc;̣n quen anh thì anh lại bu&ocirc;ng lời cay đắng....chia tay.....có lẽ em nghĩ rằng anh mu&ocirc;́n trả thù em nhưng kh&ocirc;ng phải em à.....khi lớn anh bi&ecirc;́t suy nghĩ, anh mu&ocirc;́n em và anh chỉ lo học hành, đ&ecirc;̉ l&acirc;́y c&ocirc;ng danh, sự nghi&ecirc;̣p trước r&ocirc;̀i hãy y&ecirc;u nhau sau....anh gi&acirc;́u em vì nghĩ em sẽ hi&ecirc;̉u, vì nghĩ em sẽ chờ anh................nhưng................<br />\r\n.......................anh sai r&ocirc;̀i,.............thời gian và sự c&ocirc; đơn sẽ làm thay đ&ocirc;̃i con người, thay đ&ocirc;̃i tình y&ecirc;u.........!!!!!!!!!!!<br />\r\nEm quen anh &acirc;́y khi g&acirc;̀n h&ecirc;́t năm hai, anh bi&ecirc;́t chứ..........khi đó anh đã làm đi&ecirc;̀u r&acirc;́t ngu ng&ocirc;́c phải kh&ocirc;ng em.............giờ thì cũng đã hơn 3 nă mình kh&ocirc;ng gặp nhau r&ocirc;̀i em nhỉ....đ&ecirc;́n giờ phút này tim anh v&acirc;̃n còn hình bóng em, bi&ecirc;́t sau được khi tim anh trót y&ecirc;u em r&ocirc;̀i........................................!!!!!!!!!!!!!!!!!</p>\r\n', '2020-10-17 05:16:46', 'img1.jpg', 9, 2),
(5, 'Nhớ để quên', 'Chẳng lẽ cứ xa nhau là không thể trở lại với nhau nữa và chẳng lẻ những kỹ niệm ngày xưa sẽ mãi trôi xa....!', '<p>Chẳng lẽ cứ xa nhau l&agrave; kh&ocirc;ng thể trở lại với nhau nữa v&agrave; chẳng lẻ những kỹ niệm ng&agrave;y xưa sẽ m&atilde;i tr&ocirc;i xa....!<br />\r\nPhải rồi....mới đ&oacute; cũng v&agrave;i năm rồi nhỉ...v&agrave; giờ anh cười, cười v&igrave; anh vẫn kh&ocirc;ng thể x&oacute;a t&ecirc;n em...<br />\r\nAnh ngốc thật nhỉ?. Mang theo y&ecirc;u dấu v&agrave; nỗi đau về em khi m&agrave; em đ&atilde; ra đi...ước rằng h&ocirc;m qua chỉ l&agrave; cơn mơ để anh được m&atilde;i mơ về em v&agrave; m&atilde;i kh&ocirc;ng muốc thức giấc...<br />\r\n&quot;Thế nước mắt cứ khẽ lại rơi, nỗi đau ri&ecirc;ng trong tim kh&ocirc;ng n&oacute;i n&ecirc;n lời. Hỡi nước mắt hỡi kỹ niệm ơn h&atilde;y cho ta một lần về ph&uacute;t ban đầu.....&quot;<br />\r\nCa từ n&agrave;y anh vẫn m&atilde;i kh&ocirc;ng qu&ecirc;n, anh c&agrave;i từ khi hai ta hai lối. Anh vẫn sẽ nhớ, sẽ đi, đi về ph&iacute;a kh&ocirc;ng em...</p>\r\n', '2020-10-23 11:14:55', '', 6, 2),
(6, 'Only Love', 'có phải một ngày nào đó em cũng mãi xa cuộc đời tôi !\r\ncó phải tôi vẫn luôn là người ngộ nhận về một câu chuyện tình yêu tuyệt đẹp !', '<p>có phải m&ocirc;̣t ngày nào đó em cũng mãi xa cu&ocirc;̣c đời t&ocirc;i !<br />\r\ncó phải t&ocirc;i v&acirc;̃n lu&ocirc;n là người ng&ocirc;̣ nh&acirc;̣n v&ecirc;̀ m&ocirc;̣t c&acirc;u chuy&ecirc;̣n tình y&ecirc;u tuy&ecirc;̣t đẹp !<br />\r\ntrong màn đ&ecirc;m , ca từ của &quot; Only Love&quot; ng&acirc;n vang cũng chính là lúc t&acirc;m trạng b&ocirc;̀i h&ocirc;̀i và dạt dào cảm xúc với những rung đ&ocirc;̣ng v&ecirc;̣ m&ocirc;̣t người t&ocirc;i từng r&acirc;́t y&ecirc;u....!<br />\r\nchắc giờ này em đang say gi&acirc;́c n&ocirc;̀ng sau m&ocirc;̣t ngày dài hạnh phúc...à kh&ocirc;ng ! đúng hơn là em đang t&acirc;̣n hưởng m&ocirc;̣t cu&ocirc;̣c&nbsp;s&ocirc;́ng hạnh phúc với tình y&ecirc;u của mình....<br />\r\nT&ocirc;i vui, t&ocirc;i cười khi nhìn em hạnh phúc từ phía sau - m&ocirc;̣t nơi mà chẳng bao giờ em bi&ecirc;́t - &quot; nơi phía sau hạnh phúc&quot;.<br />\r\nem bi&ecirc;́t kh&ocirc;ng, từ ngày kh&ocirc;ng còn gặp em nữa , cu&ocirc;̣c s&ocirc;́ng của anh thay đ&ocirc;̃i r&acirc;́t nhi&ecirc;̀u. Anh kh&ocirc;ng còn nghẹn ngào, b&ocirc;́i r&ocirc;́i khi th&acirc;́y em b&ecirc;n người &acirc;́y nữa, cũng kh&ocirc;ng còn từng đ&ecirc;m nhớ v&ecirc;̀ hình ảnh của em, của những kỹ ni&ecirc;̣m ngày ta còn c&acirc;́p sách đ&ecirc;́n trường. Trong anh giờ chỉ còn ký ức - m&ocirc;̣t ký ức v&ecirc;̀ m&ocirc;́i tình đ&acirc;̀u kh&ocirc;ng phai.<br />\r\ntừ khi xa em, anh đã thử r&acirc;́t nhi&ecirc;̀u cách đ&ecirc;̉ qu&ecirc;n em: &quot; Anh lao vào c&ocirc;ng vi&ecirc;̣c, vào vi&ecirc;̣c học và hơn cả anh đã ép bản th&acirc;n y&ecirc;u m&ocirc;̣t người con gái khác với hy vọng xóa được hình ảnh của em...&quot; Nhưng em à! giờ anh nh&acirc;̣n ra đi&ecirc;̀u đó là kh&ocirc;ng th&ecirc;̉...!!!<br />\r\nCu&ocirc;̣c s&ocirc;́ng b&ocirc;̣n b&ecirc;̀ với những lo toan kh&ocirc;ng th&ecirc;̉ khi&ecirc;́n anh qu&ecirc;n em, khi y&ecirc;u người con gái khác anh lại chỉ th&acirc;́y hình ảnh của em nhi&ecirc;̀u hơn....Anh ng&ocirc;́c lắm phải kh&ocirc;ng! khi bi&ecirc;́t được có người con trai khác t&ocirc;́t hơn anh y&ecirc;u em anh đã đ&acirc;̀u hàng và chúc phúc cho hai người....Th&acirc;̣t sự giờ nghỉ lại lúc đó anh th&acirc;́y mình r&acirc;́t hèn và y&ecirc;́u đu&ocirc;́i<br />\r\nnhưng n&ecirc;́u anh được quay lại lúc đó thì anh v&acirc;̃n sẽ hành đ&ocirc;̣ng như v&acirc;̣y, em bi&ecirc;́t vì sao kh&ocirc;ng ? vì Anh y&ecirc;u Em.<br />\r\nVà anh v&acirc;̃n tin sẽ có ngày chúng ta gặp lại nhau, cười nói vui đùa cùng nhau như hai người bạn th&acirc;n của ngày trước.....<br />\r\nphải kh&ocirc;ng em - người lạ từng quen !</p>\r\n', '2020-10-23 12:09:42', 'img2.jpg', 7, 1),
(7, 'Đổi thay', '“Nhớ…tiếng mưa rơi ngày xưu…lúc đôi ta còn nhau, khi tình yêu… bắt đầu…….”\r\nNhững ca từ quen thuộc của ngày nào bổng vang lên giữa một buổi chiều mưa nhẹ rơi…Đã từ rất lâu rồi tôi mới được nghe lại bài hát này. Bài hát khiến tôi nhớ về kỷ niệm một thời mà tôi cứ nghỡ như chuyện mới vừa xãy ra hôm qua vậy…!!!.', '<p>&ldquo;Nhớ&hellip;tiếng mưa rơi ng&agrave;y xưu&hellip;l&uacute;c đ&ocirc;i ta c&ograve;n nhau, khi t&igrave;nh y&ecirc;u&hellip; bắt đầu&hellip;&hellip;.&rdquo;<br />\r\nNhững ca từ quen thuộc của ng&agrave;y n&agrave;o bổng vang l&ecirc;n giữa một buổi chiều mưa nhẹ rơi&hellip;Đ&atilde; từ rất l&acirc;u rồi t&ocirc;i mới được nghe lại b&agrave;i h&aacute;t n&agrave;y. B&agrave;i h&aacute;t khiến t&ocirc;i nhớ về kỷ niệm một thời m&agrave; t&ocirc;i cứ nghỡ như chuyện mới vừa x&atilde;y ra h&ocirc;m qua vậy&hellip;!!!.<br />\r\nNg&agrave;y đ&oacute; t&ocirc;i gặp gở v&agrave; l&agrave;m quen với em trong ng&agrave;y đầu năm học. Ng&agrave;y ấy t&ocirc;i chỉ xem em như một người bạn b&igrave;nh thường, đến cả t&ecirc;n của em t&ocirc;i c&ograve;n nhớ nhầm v&agrave;i ng&agrave;y sau đ&oacute;. L&uacute;c đ&oacute; t&ocirc;i ngồi chung b&agrave;n với em hơn một th&aacute;ng v&agrave; lu&ocirc;n bị tụi bạn gh&eacute;p đ&ocirc;i t&ocirc;i với em&hellip;<br />\r\nV&agrave; rồi &hellip;!!! chuyện g&igrave; đến cũng đến&hellip;gần cuối năm học t&ocirc;i nhận ra &hellip;T&ocirc;i đ&atilde; y&ecirc;u em&hellip;!!! v&agrave; nh&igrave;n v&agrave;o mắt em t&ocirc;i biết &hellip;em cũng y&ecirc;u t&ocirc;i&hellip;!!!<br />\r\nĐến một ng&agrave;y nọ, t&ocirc;i lấy hết cam đảm để b&agrave;i tỏ t&igrave;nh cảm của m&igrave;nh với em&hellip;nhưng&hellip;!! em n&oacute;i&hellip;!!! muốn c&oacute; thời gian suy nghĩ &hellip;v&agrave;&hellip; trước mắt ch&uacute;ng ta n&ecirc;n l&agrave; bạn th&acirc;n&hellip;!!!<br />\r\nPhải&hellip;! t&ocirc;i đồng &yacute; l&agrave;m bạn th&acirc;n của em &hellip;nhưng&hellip; khoản c&aacute;ch giữa t&ocirc;i v&agrave; em ng&agrave;y c&agrave;ng lớn&hellip;!!!<br />\r\nCho đến một ng&agrave;y, &hellip;ng&agrave;y m&agrave; t&ocirc;i nhận được tin nhắn của em với nội dung:&hellip; &ldquo;Đừng l&agrave;m phiền t&ocirc;i nữa&rdquo;&hellip;.!!!<br />\r\n&ldquo;Rồi một h&ocirc;m mưa vẫn rơi, cho niềm nhớ chẳng vơi, d&ugrave; tr&ecirc;n phố hoen mắt m&ocirc;i,..nghe nỗi buồn &hellip;giăng k&iacute;n lối&hellip;.<br />\r\nC&ograve;n đ&acirc;u nữa&hellip;<br />\r\nlời đ&atilde; hứa,&hellip;<br />\r\ngiờ v&uacute;t bay,&hellip;<br />\r\nt&igrave;nh đ&atilde; m&atilde;i xa tầm tay&hellip;<br />\r\nkhi con tim em&hellip;<br />\r\nđ&atilde; tr&oacute;t mang đổi thay.<br />\r\nC&ograve;n trong anh, từng nỗi nhớ,&hellip;<br />\r\nd&ugrave; tr&aacute;i tim nghe tan vỡ,&hellip;<br />\r\ntừng chiều nghe tiếng mưa&hellip;<br />\r\nnghỡ em về&hellip;&hellip;&rdquo;<br />\r\nĐ&oacute; l&agrave; lần đầu ti&ecirc;n t&ocirc;i kh&oacute;c v&igrave; một người con g&aacute;i t&ocirc;i y&ecirc;u&hellip;!!!. Khi ấy, mọi thứ xung quanh t&ocirc;i như tối sầm lại&hellip; t&ocirc;i kh&ocirc;ng c&ograve;n nở nụ cười tr&ecirc;n m&ocirc;i như mọi ng&agrave;y&hellip;v&agrave; cũng kh&ocirc;ng c&ograve;n niềm tin , kh&ocirc;ng c&ograve;n hy vọng&hellip;!<br />\r\nChẳng phải ng&agrave;y đ&oacute; em rất vui khi ở cạnh t&ocirc;i sao? Chẳng phải em n&oacute;i ch&uacute;ng ta l&agrave; bạn th&acirc;n sao? V&agrave; chẳng phải em kh&ocirc;ng biết t&ocirc;i rất y&ecirc;u em sao?....<br />\r\nL&uacute;c đ&oacute; t&ocirc;i tự hỏi: &ldquo; l&agrave; do t&ocirc;i Thay Đổi&hellip;hay&hellip;do em đ&atilde; Đổi Thay&hellip;..???&rdquo;<br />\r\n( to be continued&hellip;)</p>\r\n', '2020-10-23 12:09:27', 'hbg_bg.jpg', 7, 5),
(17, 'Nhạc Remix', '', '', '2020-10-23 11:53:08', 'img1-703250929723100.jpg', 4, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'Administrator'),
(2, 'admindemo', 'e10adc3949ba59abbe56e057f20f883e', 'Admin Demo'),
(8, 'ngockhuong', 'e10adc3949ba59abbe56e057f20f883e', 'Lâm Ngọc Khương'),
(9, 'khuongln', 'e10adc3949ba59abbe56e057f20f883e', 'Hello World'),
(10, 'manh', '202cb962ac59075b964b07152d234b70', 'Đinh Công Mạnh');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
