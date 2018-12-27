-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 10 Gru 2018, 18:02
-- Wersja serwera: 10.1.36-MariaDB
-- Wersja PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `project_it`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `about`
--

CREATE TABLE `about` (
  `id_movie` int(255) UNSIGNED NOT NULL,
  `poster` text COLLATE utf8_polish_ci,
  `rate` float UNSIGNED DEFAULT NULL,
  `based_on` varchar(11) COLLATE utf8_polish_ci DEFAULT NULL,
  `directors` text COLLATE utf8_polish_ci,
  `writers` text COLLATE utf8_polish_ci,
  `genre` text COLLATE utf8_polish_ci,
  `country` text COLLATE utf8_polish_ci,
  `premiere` date DEFAULT NULL,
  `box_office` varchar(11) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `about`
--

INSERT INTO `about` (`id_movie`, `poster`, `rate`, `based_on`, `directors`, `writers`, `genre`, `country`, `premiere`, `box_office`, `description`) VALUES
(1, '\"img/poster1.jpg\"', 8.5, '640 157', 'Olivier Nakache, Eric Toledano', 'Olivier Nakache, Eric Toledano', 'Comedy, Biographical', 'France', '2011-09-23', '426 588 510', 'After he becomes a quadriplegic from a paragliding accident, an aristocrat hires a young man from the projects to be his caregiver.'),
(2, '\"img/poster2.jpg\"\r\n', 9.3, '2 001 889', 'Frank Darabont', 'Stephen King, Frank Darabont', 'Drama', 'USA', '1994-09-10', '59 841 469', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `actors`
--

CREATE TABLE `actors` (
  `id_movie` int(10) UNSIGNED NOT NULL,
  `actor_img1` text COLLATE utf8_polish_ci NOT NULL,
  `actor_img2` text COLLATE utf8_polish_ci NOT NULL,
  `actor_img3` text COLLATE utf8_polish_ci NOT NULL,
  `actor_p1` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `actor_p2` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `actor_p3` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `actor_p1_as` text COLLATE utf8_polish_ci NOT NULL,
  `actor_p2_as` text COLLATE utf8_polish_ci NOT NULL,
  `actor_p3_as` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `actors`
--

INSERT INTO `actors` (`id_movie`, `actor_img1`, `actor_img2`, `actor_img3`, `actor_p1`, `actor_p2`, `actor_p3`, `actor_p1_as`, `actor_p2_as`, `actor_p3_as`) VALUES
(1, '\"background-image: url(img/actors/magalie.jpg)\"', '\"background-image: url(img/actors/philippe.jpg)\"', '\"background-image: url(img/actors/driss.jpg)\"', 'Audrey Fleurot', 'FranÃ§ois Cluzet', 'Omar Sy', 'Magalie', 'Philippe', 'Driss'),
(2, '\"background-image: url(img/actors/warden.jpg)\"', '\"background-image: url(img/actors/andy.jpg)\"', '\"background-image: url(img/actors/freeman.jpg)\"', 'Bob Gunton', 'Tim Robbins', 'Morgan Freeman', 'Warden Samuel Norton', 'Andy Dufresne', 'Ellis Boyd \"Red\" Redding');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gallery`
--

CREATE TABLE `gallery` (
  `id_movie` int(10) UNSIGNED NOT NULL,
  `nr_image` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `gallery`
--

INSERT INTO `gallery` (`id_movie`, `nr_image`) VALUES
(1, 9),
(2, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `header`
--

CREATE TABLE `header` (
  `id_movie` int(255) UNSIGNED NOT NULL,
  `title` text COLLATE utf8_polish_ci,
  `description` text COLLATE utf8_polish_ci,
  `video` text COLLATE utf8_polish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `header`
--

INSERT INTO `header` (`id_movie`, `title`, `description`, `video`) VALUES
(1, 'The Intouchables', 'comedy', '\"img/video1.mp4\"'),
(2, 'The Shawshank Redemption', 'drama', '\"img/video2.mp4\"');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reviews`
--

CREATE TABLE `reviews` (
  `id_movie` int(10) UNSIGNED NOT NULL,
  `review1` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `review2` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `review3` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `reviews`
--

INSERT INTO `reviews` (`id_movie`, `review1`, `review2`, `review3`) VALUES
(1, 'Do not look at this through the prism of \"Foreign Films\". You\'d be wasting your time and miss something far too important. <br><br>\r\n        Hollywood does scale like nobody else, leaving the competition gasping in its wake. France does intimacy, and brutality. Nothing is sacred. And rather than try to revive the New Wave or emulate Hollywood like most widely seen French films of late, \"Intouchables\" harnesses its core strengths - ease with intimacy, willingness to ridicule anything and brutal honesty - and delivers one of the funniest, most honest and touching films I have ever seen.<br><br>\r\n        Sy is a failed robber, going through the motions and playing the stereotypical jobless Ã©migrÃ©. Cluzet is a romantic and melancholy mind trapped in a useless body. The circumstances that bring them together are too funny to spoil here, but meet they do, and an awkward relationship quickly blossoms as they bring out the best in each other.<br><br>\r\n        The film\'s simplicity is delightfully misleading: the script is a masterpiece of comedy writing, and however good the rest of the cast is, the central duo is magical. Sy\'s comic timing will have you in stitches, but it is his honesty and vulnerability that make you fall in love with the character. Cluzet isn\'t your typical sad-sack, instead, much of the finest pleasures in the film consist in watching him use his keen mind to mess with the world around him (a subplot about an abstract painting really takes the biscuit, you\'ll know it when you see it).<br><br>\r\n        This is one of the most unique, beautiful and honest friendships ever committed to film. It will make you laugh, it will make you cry... a delightful celebration of everything in life that makes it worthwhile.<br><br>', 'I am now trying to find words to describe this movie for an hour. I couldn\'t. <br><br>\r\n      You\'ve seen it, or you haven\'t. It\'s monumental and outrageously good.<br><br>\r\n      The cast is brilliant. The jokes lovely. The story and the idea behind the movie is beautiful. Especially when you\'ve worked/lived with handicapped people. The music is such a perfect choice, it is unbelievable. <br><br>\r\n      hope this movie makes a plenty of people think about how good their life is and how bad it could have been.<br><br>\r\n      Bottom line: Oscar-worthy. Period. <br><br>', 'My my where do I begin.<br><br>\r\n      To start with I did not want the movie to end at all. Its becoming more and more rare for movies as this one to come by. This movie completes the circle, as far as movie going experience goes. The movie has left me with a sort of warm feeling in my heart that cannot be said in words alone. There is something about the way French movies are made, when they get it right they are simply par excellence. Hollywood kisses concrete. <br><br>\r\n      Anyway, I feel most of us humans are quadriplegic though not physically but emotionally in someway or other. But what one may agree is that when you cry you cry alone, but when you laugh the whole world laughs with you.<br><br>\r\n      If just by the word \"quadriplegic\" you are expecting it to be a dark, heart shattering, emotionally overloaded movie then I would passionately defend against such a prejudiced opinion. One is not the physical form alone. One can have a beautiful body but a black heart and vice-verse.<br><br>\r\n      A very well written, full bodied script and an exceptionally well directed movie. Characters cannot become more real than this on the silver screen. Omar Sy in my opinion has done a very good job. He lived his character and not played it. To contrast him we have FranÃ§ois Cluzet who kept the sparks flying. Omar Sy\'s comments on Bach, Vivaldi etc classics had me in splits. And also do not miss out on the singing Human tree, the very mentioning of which is having me in splits.<br><br>\r\n      Wow !!! that was some movie. Go get this movie guys and see it today, no now.<br><br>'),
(2, 'Why do I want to write the 234th comment on The Shawshank Redemption? I am not sure - almost everything that could be possibly said about it has been said. But like so many other people who wrote comments, I was and am profoundly moved by this simple and eloquent depiction of hope and friendship and redemption.<br><br>\r\nThe only other movie I have ever seen that effects me as strongly is To Kill a Mockingbird. Both movies leave me feeling cleaner for having watched them.<br><br>\r\nI didn\'t intend to see this movie at all: I do not like prison movies and I don\'t normally watch them. I work at a branch library and one day as I was checking The Shawshank Redemption out to one of our older patrons, she said to me, \"Whenever I feel down or depressed, I check out this movie and watch it and it always makes me feel better.\" At the time, I thought that was very strange. One day there was nothing on TV except things I absolutely would not watch under any circumstance or things that I had seen too many times already. I remembered what she said, so I watched it. I have watched it many many times since then and it gets better with every showing.<br><br>\r\nNo action, no special effects - just men in prison uniforms talking to each other.<br><br>\r\nThe Shawshank Redemption and To Kill a Mockingbird are the best movies I have ever seen. I do not judge it by it\'s technical merits - I don\'t really care about that. I have read that Citizen Kane or The Godfather or this or that movie is the best movie ever made. They may have the best technique or be the most influential motion pictures ever made, but not the best. The best movies are ones that touch the soul. It takes a movie like The Shawshank Redemption to touch the soul.<br><br>', 'I have never seen such an amazing film since I saw The Shawshank Redemption. Shawshank encompasses friendships, hardships, hopes, and dreams. And what is so great about the movie is that it moves you, it gives you hope. Even though the circumstances between the characters and the viewers are quite different, you don\'t feel that far removed from what the characters are going through.<br><br>\r\nIt is a simple film, yet it has an everlasting message. Frank Darabont didn\'t need to put any kind of outlandish special effects to get us to love this film, the narration and the acting does that for him. Why this movie didn\'t win all seven Oscars is beyond me, but don\'t let that sway you to not see this film, let its ranking on the IMDb\'s top 250 list sway you, let your friends recommendation about the movie sway you.<br><br>\r\nSet aside a little over two hours tonight and rent this movie. You will finally understand what everyone is talking about and you will understand why this is my all time favorite movie.<br><br>', 'This movie is not your ordinary Hollywood flick. It has a great and deep message. This movie has a foundation and just kept on being built on from their and that foundation is hope.<br><br>\r\nOther than just the message of this movie the acting was phenomenal. Tim Robbins gave one of the greatest performances ever. He was inspiring, intelligent and most of all positive. His performance just made me smile. Robbins plays Andy Dufresne who was wrongfully convicted of murdering his wife and her lover. He is gets to life sentences but yet never gives up hope. In he becomes friends with Ellis Boyd \"Red\" Redding played by Morgan Freeman. Freeman who gives the finest performance of his career has unlike Robbins lost hope. He is in deep regret of the crime that he committed. His way of deflecting the pain away is by trying to not feel anything at all. With his friendship with Andy he learns that without our hopes and dreams we have nothing. Andy also becomes friends with the rest of Red\'s group. James Whitmore also gave a great performance as Brooks Halten who gets out of prison parole but in the words of Red he has been \"institutionalized\". <br><br>\r\nThe directing by Frank Darabont was just magnificent. He kept this movie at a great steady pace along with the writing and great cinematography. He portrayed prison life in such a horrifying way, but not in terms of the physical pain but the stress and pain that wares mentally on the inmates, some of which deserve a second chance. <br><br>\r\nWhatever you do, don\'t listen to the people who say this movie is overrated because this is one of the most inspiring and greatest movies ever. It has everything you could possibly want.<br><br>');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id_movie`);

--
-- Indeksy dla tabeli `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id_movie`);

--
-- Indeksy dla tabeli `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id_movie`);

--
-- Indeksy dla tabeli `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id_movie`);

--
-- Indeksy dla tabeli `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id_movie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
