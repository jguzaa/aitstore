-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 10, 2019 at 08:03 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eStore`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessory`
--

CREATE TABLE `accessory` (
  `accId` int(11) NOT NULL,
  `accType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accessory`
--

INSERT INTO `accessory` (`accId`, `accType`) VALUES
(1, 'power bank'),
(2, 'cable'),
(3, 'charger'),
(4, 'screen protector'),
(5, 'case');

-- --------------------------------------------------------

--
-- Table structure for table `accessorysupport`
--

CREATE TABLE `accessorysupport` (
  `accId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `supportedPID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accessorysupport`
--

INSERT INTO `accessorysupport` (`accId`, `productId`, `supportedPID`) VALUES
(2, 18, 4),
(2, 18, 3),
(4, 21, 6),
(4, 22, 1),
(5, 23, 3),
(5, 24, 1),
(3, 20, 4),
(3, 20, 3),
(3, 20, 1),
(3, 20, 5),
(3, 20, 8),
(3, 20, 10),
(3, 20, 12),
(3, 20, 14),
(3, 20, 11);

-- --------------------------------------------------------

--
-- Table structure for table `accessory_product`
--

CREATE TABLE `accessory_product` (
  `accId` int(11) NOT NULL,
  `productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accessory_product`
--

INSERT INTO `accessory_product` (`accId`, `productId`) VALUES
(1, 15),
(1, 16),
(2, 17),
(2, 18),
(3, 19),
(3, 20),
(4, 21),
(4, 22),
(5, 23),
(5, 24);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `customerId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `QTY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`customerId`, `productId`, `QTY`) VALUES
(26, 21, 1),
(26, 18, 1),
(1, 1, 1),
(1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `cName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `cName`) VALUES
(1, 'Google'),
(2, 'Apple'),
(3, 'Samsung'),
(4, 'Oppo'),
(5, 'Huawei'),
(6, 'LG'),
(7, 'Nokia'),
(8, 'Accessory');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerId` int(11) NOT NULL,
  `fName` varchar(20) NOT NULL,
  `lName` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contactNo` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `profilePic` varchar(20) DEFAULT NULL,
  `dob` date NOT NULL,
  `username` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerId`, `fName`, `lName`, `email`, `password`, `contactNo`, `address`, `profilePic`, `dob`, `username`) VALUES
(1, 'Jongjet', 'Wong', 'j_guzaa@hotmail.com', '$2y$10$4TMCvjYoRVXLnv1G2dT.BuMgae3wP0HSQB7fJ22FuiXjsbweNHXue', '0415555555', '1222', NULL, '2019-08-06', 'jguzaa'),
(25, 'Jim', 'Thomsan', 'jim@hotmail.com', '$2y$10$DdTn7tCjoRcPFdekGJD10.6GfEg4n4FLbgtl2F6CFVu0ngAABzcEy', '0411222323', '222', NULL, '1989-09-19', 'jim99'),
(26, 'Josh', 'Mighel', 'josh@hotmail.com', '$2y$10$z4W0yTwBcFBLQNGDRVWSwuAqQI6f3BEDiK6ASbwHypWMv1HwcOodK', '2222222222', '222', NULL, '2019-09-19', 'MJ001'),
(27, 'Jim', 'Thomsan', 'jim2@hotmail.com', '$2y$10$v3RZYAUBWjjzmIjFwtS2r.yv8lLBbRQvpbfR9dIBMy2FBDxbvuUIm', '0411222323', '165 NNi', NULL, '1999-03-01', 'MJ001');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `orderId` int(11) NOT NULL,
  `orderStatus` varchar(30) NOT NULL,
  `trackingNo` varchar(10) NOT NULL,
  `customerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `QTY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentId` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `orderId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `pictureId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `link1` varchar(100) NOT NULL,
  `link2` varchar(100) NOT NULL,
  `link3` varchar(100) NOT NULL,
  `link4` varchar(100) NOT NULL,
  `link5` varchar(100) NOT NULL,
  `link6` varchar(100) NOT NULL,
  `link7` varchar(100) NOT NULL,
  `link8` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`pictureId`, `productId`, `link1`, `link2`, `link3`, `link4`, `link5`, `link6`, `link7`, `link8`) VALUES
(1, 1, 'Pictures/Products/phones/Google-px3-1.jpg', 'Pictures/Products/phones/Google-px3-2.jpg', '', '', '', '', '', ''),
(2, 2, 'Pictures/Products/phones/Google-px3xl-1.jpg', 'Pictures/Products/phones/Google-px3xl-2.jpg', '', '', '', '', '', ''),
(3, 3, 'Pictures/Products/phones/Apple-xsm-1.jpg', 'Pictures/Products/phones/Apple-xsm-2.jpg', '', '', '', '', '', ''),
(4, 4, 'Pictures/Products/phones/Apple-8-1.jpg', 'Pictures/Products/phones/Apple-8-2.jpg', '', '', '', '', '', ''),
(5, 5, 'Pictures/Products/phones/SS-s9-1.jpg', 'Pictures/Products/phones/SS-s9-2.jpg', 'Pictures/Products/phones/SS-s9-3.jpg', '', '', '', '', ''),
(6, 6, 'Pictures/Products/phones/SS-s10-1.jpg', 'Pictures/Products/phones/SS-s10-2.jpg', 'Pictures/Products/phones/SS-s10-3.jpg', 'Pictures/Products/phones/SS-s10-4.jpg', 'Pictures/Products/phones/SS-s10-5.jpg', 'Pictures/Products/phones/SS-s10-6.jpg', '', ''),
(7, 7, 'Pictures/Products/phones/oppo-AX5s-1.jpg', 'Pictures/Products/phones/oppo-AX5s-2.jpg', 'Pictures/Products/phones/oppo-AX5s-3.jpg', 'Pictures/Products/phones/oppo-AX5s-4.jpg', 'Pictures/Products/phones/oppo-AX5s-5.jpg', 'Pictures/Products/phones/oppo-AX5s-6.jpg', '', ''),
(8, 8, 'Pictures/Products/phones/oppo-renoZ-1.jpg', 'Pictures/Products/phones/oppo-renoZ-2.jpg', 'Pictures/Products/phones/oppo-renoZ-3.jpg', 'Pictures/Products/phones/oppo-renoZ-4.jpg', '', '', '', ''),
(9, 9, 'Pictures/Products/phones/Hw-nova3e-1.jpg', 'Pictures/Products/phones/Hw-nova3e-2.jpg', 'Pictures/Products/phones/Hw-nova3e-3.jpg', 'Pictures/Products/phones/Hw-nova3e-4.jpg', 'Pictures/Products/phones/Hw-nova3e-5.jpg', 'Pictures/Products/phones/Hw-nova3e-6.jpg', 'Pictures/Products/phones/Hw-nova3e-7.jpg', 'Pictures/Products/phones/Hw-nova3e-8.jpg'),
(10, 10, 'Pictures/Products/phones/Hw-p30p-1.jpg', 'Pictures/Products/phones/Hw-p30p-2.jpg', 'Pictures/Products/phones/Hw-p30p-3.jpg', 'Pictures/Products/phones/Hw-p30p-4.jpg', 'Pictures/Products/phones/Hw-p30p-5.jpg', '', '', ''),
(11, 11, 'Pictures/Products/phones/LG-v30p-1.jpg', 'Pictures/Products/phones/LG-v30p-2.jpg', 'Pictures/Products/phones/LG-v30p-3.jpg', 'Pictures/Products/phones/LG-v30p-4.jpg', 'Pictures/Products/phones/LG-v30p-5.jpg', '', '', ''),
(12, 12, 'Pictures/Products/phones/LG-v40-1.jpg', 'Pictures/Products/phones/LG-v40-2.jpg', 'Pictures/Products/phones/LG-v40-3.jpg', 'Pictures/Products/phones/LG-v40-4.jpg', 'Pictures/Products/phones/LG-v40-5.jpg', '', '', ''),
(13, 13, 'Pictures/Products/phones/nokia-8-1-1.jpg', 'Pictures/Products/phones/nokia-8-1-2.jpg', 'Pictures/Products/phones/nokia-8-1-3.jpg', 'Pictures/Products/phones/nokia-8-1-4.jpg', 'Pictures/Products/phones/nokia-8-1-5.jpg', 'Pictures/Products/phones/nokia-8-1-6.jpg', '', ''),
(14, 14, 'Pictures/Products/phones/nokia-9-1.jpg', 'Pictures/Products/phones/nokia-9-2.jpg', 'Pictures/Products/phones/nokia-9-3.jpg', 'Pictures/Products/phones/nokia-9-4.jpg', 'Pictures/Products/phones/nokia-9-5.jpg', 'Pictures/Products/phones/nokia-9-6.jpg', '', ''),
(15, 15, 'Pictures/Products/accessories/acc-PWBank-JKR-any-1.jpg', '', '', '', '', '', '', ''),
(16, 16, 'Pictures/Products/accessories/acc-PWBank-CN-any-1.png', '', '', '', '', '', '', ''),
(17, 17, 'Pictures/Products/accessories/acc-Cable-SS-MicroNC-1.jpg', 'Pictures/Products/accessories/acc-Cable-SS-MicroNC-2.jpg', 'Pictures/Products/accessories/acc-Cable-SS-MicroNC-3.jpg', 'Pictures/Products/accessories/acc-Cable-SS-MicroNC-4.jpg', '', '', '', ''),
(18, 18, 'Pictures/Products/accessories/acc-Cable-Belkin-LN-1.png', 'Pictures/Products/accessories/acc-Cable-Belkin-LN-2.jpg', 'Pictures/Products/accessories/acc-Cable-Belkin-LN-3.jpg', '', '', '', '', ''),
(19, 19, 'Pictures/Products/accessories/acc-Chg-XCD-any-1.jpg', '', '', '', '', '', '', ''),
(20, 20, 'Pictures/Products/accessories/acc-Chg-Belkin-wChg-1.jpg', '', '', '', '', '', '', ''),
(21, 21, 'Pictures/Products/accessories/acc-SCProt-Griff-SsS10-1.jpg', '', '', '', '', '', '', ''),
(22, 22, 'Pictures/Products/accessories/acc-SCProt-CN-GgPx3-1.jpg', '', '', '', '', '', '', ''),
(23, 23, 'Pictures/Products/accessories/acc-case-lifepf-apXsM-1.jpg', 'Pictures/Products/accessories/acc-case-lifepf-apXsM-2.jpg', 'Pictures/Products/accessories/acc-case-lifepf-apXsM-3.jpg', 'Pictures/Products/accessories/acc-case-lifepf-apXsM-4.jpg', 'Pictures/Products/accessories/acc-case-lifepf-apXsM-5.jpg', '', '', ''),
(24, 24, 'Pictures/Products/accessories/acc-case-SP-GP3-1.jpg', 'Pictures/Products/accessories/acc-case-SP-GP3-2.jpg', 'Pictures/Products/accessories/acc-case-SP-GP3-3.jpg', 'Pictures/Products/accessories/acc-case-SP-GP3-4.jpg', 'Pictures/Products/accessories/acc-case-SP-GP3-5.jpg', 'Pictures/Products/accessories/acc-case-SP-GP3-6.jpg', 'Pictures/Products/accessories/acc-case-SP-GP3-7.jpg', 'Pictures/Products/accessories/acc-case-SP-GP3-8.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` int(11) NOT NULL,
  `pName` varchar(80) NOT NULL,
  `price` double(6,2) NOT NULL,
  `catagoryId` int(11) NOT NULL,
  `ProductDescription` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `pName`, `price`, `catagoryId`, `ProductDescription`) VALUES
(1, 'Google Pixel 3 64GB (Clearly White)', 1199.00, 1, '<b>Overview</b> <br> <b>Hey Google, get it done</b><br> Get more done with an extraordinary camera, fast-charging battery [1] and the helpful Google Assistant built in [2] . Its the essential Google experience, at a smart price.<br><b>Capture better pictures with Night Sight.</b><br> You will never want to use your flash again. Night Sight lets you capture rich detail and colour, even in the dark.'),
(2, 'Google Pixel 3a XL 64GB (Just Black)', 799.00, 1, '<b>Overview</b> <br> <b>Hey Google, get it done</b><br> Get more done with an extraordinary camera, fast-charging battery [1] and the helpful Google Assistant built in [2] . Its the essential Google experience, at a smart price.<br><b>Capture better pictures with Night Sight.</b><br> You will never want to use your flash again. Night Sight lets you capture rich detail and colour, even in the dark.'),
(3, 'Apple iPhone XS Max 64GB (Space Grey)', 1799.00, 2, '<b>Overview</b><br>  iPhone XS Max features a 6.5-inch Super Retina display with custom-engineered OLED panels for an HDR display that provides the  best colour accuracy, as well as true blacks and remarkable brightness.1 Advanced Face ID lets you securely unlock your iPhone, log in to apps and pay with just a glance. The A12 Bionic chip with next-generation Neural Engine uses real-time machine learning to transform the way you experience photos, gaming, augmented reality and more. '),
(4, 'Apple iPhone 8 64GB (Space Grey)', 979.00, 2, '<b>Overview</b><br>  iPhone 8 is a new generation of iPhone. Designed with the most durable glass ever in a smartphone and a stronger, aerospace-grade aluminium band. Charges wirelessly.1 Resists water and dust.2 4.7-inch Retina HD display with True Tone.3 12-megapixel camera with a new sensor and an advanced image signal processor. Powered by A11 Bionic, the smartest and most powerful chip ever in a smartphone. Supports augmented reality experiences in games and apps. With iPhone 8, intelligence has never looked better.'),
(5, 'Samsung Galaxy S9 256GB (Midnight Black)', 1149.00, 3, '<b>Overview</b><br>  <b>Super Slow-mo</b><br> The camera that radically slows down time, making everyday moments epic. <br> <b>AR Emoji</b><br> The camera that turns you into an emoji, so you are not the you everyone else is. <br> <b>Dual Aperture</b><br> The revolutionary camera that adapts like the human eye, capturing stunning pictures in super low light.'),
(6, 'Samsung Galaxy S10 128GB (Prism Green)', 1349.00, 3, '<b>Overview</b><br>  No notch. No interruptions. The powerful new Galaxy S10 features a cinematic bezel-less screen to give you immersive viewing. Shoot like a professional with our Pro-grade camera and count on a battery so powerful, it can charge others with Wireless PowerShare.'),
(7, 'OPPO AX5s (Black)', 279.00, 4, '<b>Overview</b><br>  <b>Waterdrop Screen</b><br> <b>Widen your view</b><br> The vibrant display features a striking 6.2-inch Corning Gorilla Glass screen, enabling you to view more of what you love in a truly immersive experience.  <br><b>Classic Colour</b><br> Designed with you in mind Just like a diamond is timeless, the OPPO AX5s comes in two classic colourways, Red or Black. Show your inner artistic temperament with flare and style.'),
(8, 'OPPO Reno Z (Aurora Purple)', 499.00, 4, '<b>Overview</b><br>  Reno is about seeing the world from completely new perspectives. The technology behind Reno elevates photography and mobile entertainment to all-new heights. Let Reno further your vision.  <br><b>3D Sleek Unified Body</b><br> <b>Appropriate but Not Compromising, Neat but Never Dull</b><br>  The Reno Z powerful camera lies concealed within the flawless contours of its 3D Corning Gorilla Glass 5 surface. With its radian shape designed to fit comfortably in your hand and cleverly designed O-Dot anti-abrasion structure, its look and feel bring to mind a gently rippling pool.    <br><b>Hidden Fingerprint Unlock</b><br> Unlock at the Speed of Light An upgraded recognition structure combined with a more efficient AI algorithm enables even faster and more accurate unlocking.'),
(9, 'Huawei Nova 3e (Klein Blue)', 399.00, 5, '<B>Overview</B><BR>  <b>The Best Just Got Better</b><br> Lose yourself in your screen with new generation HUAWEI FullView Display. Designed for life on the go with no compromises, the HUAWEI Nova 3e sports a sleek compact frame that is almost entirely dedicated to its 5.84-inch Full HD screen.<br> <b>Body & Soul</b><br> The HUAWEI Nova 3e takes colour to a higher level. Delve deeper into Klein Blue, a radiant shade that incorporates a nanometer-level light dazzle texture. Available too in deepest Midnight Black to contrast against the vibrancy of the Full HD screen, refined classic Platinum Gold and Sakura Pink with its rich pearlescent tone.'),
(10, 'Huawei P30 Pro (Breathing Crystal)', 1399.00, 5, '<b>Overview</b><br>  Zoom in to explore the mystery of the celestial at night, watch an eagle hovering over trees or examine the delicate details of crystal. Capture the best things happening now and create your vision for the future. The HUAWEI P30 Pro is accentuating a new peak of smartphone photography.  <br><b>The Future of Photography</b><br> The revolutionary Leica Quad Camera System enhances your photography letting you see the world in its entirety. With the combination of a SuperZoom and Ultra Wide Angle Lens, a 40 megapixel Super Sensing Camera and a unique HUAWEI TOF Camera (Time-of-flight camera), the Huawei P30 Pro lets you capture beauty in all its splendour.  .'),
(11, 'LG V30+ 128GB Handset (Black)', 799.00, 6, '<b>Overview</b><br>  <b>Balanced Dsign</b></br> Sturdy and Seamless</br> The LG V30+ is LG\'s ultimate expression of visual quality, with seamless curves, minimal bezels, and a 6\" OLED FullVision Display - all fitting in the palm of your hand.<br> The phone has an IP68 rating.  <br><b>Key Features</b></br>  6\" QHD+ OLED FullVision Display See More, Hold Less The LG OLED display has breathtaking colour accuracy, and incorporates plastic for higher flexibility. Combined with FullVision technology, the LG V30+ 6 display makes your viewing experience a real treat'),
(12, 'LG V40 ThinQ 128GB Handset (Moroccan Blue)', 799.00, 6, '<b>Key Features</b><br>  <b>See More, Hold Less</b><br> Design that draws you in. Get immersed in perfect blacks with the large 6.4 OLED FullVision display, precisely engineered from metal and glass in a form that feels truly natural to hold.  <br><b>Triple Preview</b><br> Get a live preview of all three rear cameras telephoto zoom, standard and super wide-to compare and select the best lens for your scene.  <br><b>Triple Shot</b><br> Easily capture three photos-standard, telephoto zoom, and super wide-angle with just one click.'),
(13, 'Nokia 8.1 (Steel/Copper)', 649.00, 7, '<b>Overview</b><br>  Elegantly European, the Nokia 8.1 punches above its weight with the latest innovations from Google and extraordinary imaging achieved with its highly sensitive, industry-leading sensor, dual cameras with ZEISS optics and AI-Advanced 20MP Selfie Camera. PureDisplay screen technology delivers stunning HDR cinematic-quality even in bright sunlight, while Qualcomm\'s new high-performance Snapdragon 710 processor and Android 9 Pie\'s Adaptive Battery ensures smooth performance for up to 2 days on a single charge1.   <br><b>Key Features</b><br>  Latest Google innovations Unleash the power of AI with Google\'s latest Android 9 Pie. It will adapt to how you use your phone and improve over time, keeping things running smoother for longer. And, as part of the Android One family, Nokia 8.1 delivers a clean, intuitive and easy-to-navigate user experience endorsed by Google with guaranteed software upgrades and monthly security updates.'),
(14, 'Nokia 9 PureView with Android One (Midnight Blue)', 899.00, 7, '<b>Overview</b><br>  Enjoy a Google-designed OS experience that\'s refreshingly pure and intuitive in a phone made for photography enthusiasts. It\'s free from hidden processes that eat-up battery life and comes packed with the latest AI innovations. Plus, as part of the Android One family your Nokia will be among the first to receive new features from Google-so it just keeps getting better.  <br> <b>Key Features</b><br>  <b>World\'s first 5-camera array with ZEISS optics, in a phone made for photographers.</b><br> The industry defying camera captures DSLR-quality depth of field and 10 x more light than single-colour sensors[1]. All 5 of the 12MP cameras shoot simultaneously - with 3 monochromatic sensors for sharpness and 2 colour sensors. So, whether you\'re a photographer or enthusiast you can now shoot photos on your phone with unparalleled dynamic range.'),
(15, 'Jackery Power2Go Dock with 2 x 5100mAh Power Bank', 109.95, 8, '<b>Key Features</b><br>  Charge up to 2 devices simultaneously<br>  Up To 250 Hours extra Operation Time<br>  Advanced power lock technology for up to 6 months standby power<br>  5100mAH x 2 Battery Capacity<br>  Input: 5V/2A<br>  Output: 5V/2.1A<br>  Lightweight Design<br>  Includes Micro USB Cable<br>  Pre-Charged & ready for use<br>  LED charge indicator<br>  Airplane-safe<br>'),
(16, 'Cygnett ChargeUp Compact 10,000 mAh (Black)', 59.95, 8, '<b>Key Features</b><br>Up to 52 additional hours of smartphone battery life<br>Charge 2 smartphones at once<br>Compact, pocket friendly form factor<br>LED battery indicator<br>Pre-charged and ready to usev'),
(17, 'Samsung Data Cable Combo (Type-C and Micro USB)', 19.95, 8, '<b>Key Features</b><br>  2-in-1 connection<br>  Supports USB Typ-C interface as well as Micro-USB<br>  Length 1.5m<br>'),
(18, 'Belkin MixIT DuraTek Lightning to USB Cable (Gold)', 34.95, 8, '<b>Overview</b><br>  Not just any charge cable, DuraTek cables were forged from superior quality materials for ultimate durability. Kevlar fibers reinforce the inner wiring for added strength, abrasion-resistant nylon forms a tough outer jacket, and highly flexible insulation minimizes damage from friction. The strength created by these resilient ingredients is further enhanced by smart design details to reinforce the cable at its stress points. This ensures the finished product can withstand even the most demanding routines, and perform above and beyond expectation to deliver a cable that borders on indestructible.'),
(19, 'XCD Essentials 5 Port USB Charger 39W/7.8A', 49.95, 8, '<b>Overview</b><br>  The desktop USB Charger allows you to charge up to 5 devices at once.  With 39 Watts of power you can charge smartphones, tablets and other USB devices quickly and easily.  This charger is compatible with USB devices such as smartphones, GPS, cameras and tablets.  <br> <b>Key Features</b><br>  Built-in protection against over heating and short circuits<br>  Vertical or Horizontal set up<br>  Total power Output 7.8A/39W<br>  5V / 2.4A + 2.4A + 1A + 1A+ 1A <br> Includes 1.5m power cable<br>'),
(20, 'Belkin BoostUp 5W Qi Wireless Charging Stand (Black)', 49.94, 8, '<b>Overview</b><br>  Try wireless charging with the affordable BOOST UP Wireless Charging Stand. 5W is perfect for charging throughout the day or an overnight power up. Qi certification provides peace of mind while universal compatibility makes it easy to find the charger that\'s right for your Qi-compatible phone or tablet.  <br><b>Up to 5w charging power</b><br> Say goodbye to low power anxiety. With this Qi-certified stand at your desk you are able to keep your smartphone accessible while charging up to 5W throughout the day. Staying charged all day is easier than ever. Keep a BOOST UP Wireless Charging Stand on your nightstand and wake each morning fully charged.'),
(21, 'Griffin TPU Film Screen Protector for Samsung Galaxy S10', 24.95, 8, '<b>Key Features</b><br>  Self-regenerative coating<br>   Bubble-free Installation<br>   Perfect clarity and adhesion<br>   Seamless touchscreen experience<br>'),
(22, 'Cygnett RealCurve 3D Double Tempered Glass for Google Pixel 3', 49.94, 8, '<b>Overview</b><br>  The RealCurve 3D Edge to Edge 9H Double Tempered Glass Screen Protector offers screen protection against damage due to everyday wear and tear from daily use items such as keys and coins. On top of the added protection from scratches and damage, the RealCurve 3D also provides protection from fingerprints, water, and oil as well as smudges.  The RealCurve 3D Screen Protector offers optimal clarity and protection for your phone and its precise laser cut process ensures a perfect curved fit for your new Google Pixel 3, along with a bubble-free easy application ensuring it will go on your iPhone\'s screen easily.'),
(23, 'Lifeproof Fre Case for iPhone XS Max (Black)', 129.95, 8, '<b>Overview</b><br>  If you spy a soggy future on your horizon, fortify your iPhone Xs Max with the only case purpose-built for water: FRE. <br> <b>Key Features</b><br>  Equipped with a subtle screen cover, FRE  blocks the elements from scuffing your touchscreen  FRE lets you ditch the charging cable-it\'s fully compatible with a QI wireless charging base  Tailored to exact specs, FRE features a low-profile design that feels like it\'s not even there <br> Submersible up to 2m for 1 hour'),
(24, 'Speck Presidio Stay Clear Case for Google Pixel 3', 49.95, 8, '<b>Overview</b><br>  This slim case stays clearly beautiful longer. Its high-tech coating resists UV rays, oils, and other substances to help prevent discoloration. A patented two-layer design absorbs and disperses shock on impact. Engineered to withstand drops of up to 8 feet, these cases have been tested by third-party laboratories to ensure superior protection. A raised bezel helps to protect your screen from scratching and shattering if your phone falls face-down.  <br> <b>Key Features</b><br>  8-foot drop-protection with IMPACTIUM CLEAR shock barrier IMPACTIUM CLEAR material on the inside perimeter compresses on impact to absorb and disperse shock. Dropped from 8 feet multiple times by independent labs to ensure superior protection.');

-- --------------------------------------------------------

--
-- Table structure for table `productdetail`
--

CREATE TABLE `productdetail` (
  `detailId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `detail1` varchar(1000) NOT NULL,
  `detail2` varchar(1000) NOT NULL,
  `detail3` varchar(1000) NOT NULL,
  `detail4` varchar(1000) NOT NULL,
  `detail5` varchar(1000) NOT NULL,
  `detail6` varchar(1000) NOT NULL,
  `detail7` varchar(1000) NOT NULL,
  `detail8` varchar(1000) NOT NULL,
  `detail9` varchar(1000) NOT NULL,
  `hl1` varchar(100) NOT NULL,
  `hl2` varchar(100) NOT NULL,
  `hl3` varchar(100) NOT NULL,
  `hl4` varchar(100) NOT NULL,
  `hl5` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productdetail`
--

INSERT INTO `productdetail` (`detailId`, `productId`, `detail1`, `detail2`, `detail3`, `detail4`, `detail5`, `detail6`, `detail7`, `detail8`, `detail9`, `hl1`, `hl2`, `hl3`, `hl4`, `hl5`) VALUES
(1, 1, 'Display<br>\r\nFull-screen 6.0\" (152.4 mm) display <br>\r\nFHD+ (2160 x 1080) OLED at 402 ppi <br>\r\n18:9 aspect ratio<br>\r\nAlways-on display<br>\r\nNow playing', 'Processors<br>\r\nQualcomm&reg; Snapdragon&trade; 670<br>\r\n2.0GHz + 1.7GHz, 64-bit Octa-Core<br>\r\nAdreno 615<br>\r\nTitan M Security Module', 'Rear Camera<br>\r\n12.2 MP dual-pixel<br>\r\n1.4 micro-m pixel width<br>\r\nAuto-focus with dual-pixel phase detection<br>\r\nOptical + electronic image stabilisation f/1.8 aperture\r\n76&deg; field of view', 'Front Camera<br>\r\n8MP<br>\r\n1.12micro-m pixel size<br>\r\nf/2.0 aperture<br>\r\nFixed focus<br>\r\n84&deg; field of view', 'Video<br>\r\nRear Camera:<br>\r\n1080p @ 30fps, 60fps, 120fps<br>\r\n720p @ 30fps, 60fps, 240fps<br>\r\n4K @ 30fps<br><br>\r\n\r\nFront Camera:<br>\r\n1080p @ 30fps<br>\r\n720p @ 30fps<br>\r\n480p @ 30fps', 'Sensors<br>\r\nActive Edge&trade; *<br>\r\nProximity / Ambient light sensor<br>\r\nAccelerometer / Gyrometer<br>\r\nMagnetometer<br>\r\nPixel Imprint&trade;  back-mounted fingerprint<br>\r\nsensor for fast unlocking<br>\r\nBarometer<br>\r\nAndroid Sensor Hub<br>\r\nHaptics<br><br>\r\n\r\n* Requires internet connection', 'Charging<br>\r\nUSB-C&trade; 18W adapter with USB-PD 2.0<br>\r\n18W fast charging *<br><br>\r\n\r\n*Charging rates are based upon use of the included charger. Actual results may vary.', 'In the box<br>\r\n18 W USB-CTM power adaptor<br>\r\n1 m USB-C to USB-C cable (USB 2.0) Quick start guide<br>\r\nQuick Switch Adaptor<br>\r\nSIM tool', 'OS + Assistant<br>\r\nThe latest Android 9.0 Pie + Google Assistant with Lens', 'Pixel\'s extraordinary camera, for all your moments', 'Charges fast. Lasts all day', 'Do more with the Google Assistant', '', ''),
(2, 2, 'Display<br>\r\nFull-screen 6.0\" (152.4 mm) display <br>\r\nFHD+ (2160 x 1080) OLED at 402 ppi <br>\r\n18:9 aspect ratio<br>\r\nAlways-on display<br>\r\nNow playing', 'Processors<br>\r\nQualcomm&reg; Snapdragon&trade; 670<br>\r\n2.0GHz + 1.7GHz, 64-bit Octa-Core<br>\r\nAdreno 615<br>\r\nTitan M Security Module', 'Rear Camera<br>\r\n12.2 MP dual-pixel<br>\r\n1.4 micro-m pixel width<br>\r\nAuto-focus with dual-pixel phase detection<br>\r\nOptical + electronic image stabilisation f/1.8 aperture<br>\r\n76&deg; field of view', 'Front Camera<br>\r\n8MP<br>\r\n1.12micro-m pixel size<br>\r\nf/2.0 aperture<br>\r\nFixed focus<br>\r\n84&deg; field of view', 'Video<br>\r\nRear Camera:<br>\r\n1080p @ 30fps, 60fps, 120fps<br>\r\n720p @ 30fps, 60fps, 240fps<br>\r\n4K @ 30fps<br>\r\n\r\nFront Camera:<br>\r\n1080p @ 30fps<br>\r\n720p @ 30fps<br>\r\n480p @ 30fps', 'Sensors<br>\r\nActive Edge&trade; *<br>\r\nProximity / Ambient light sensor<br>\r\nAccelerometer / Gyrometer<br>\r\nMagnetometer<br>\r\nPixel Imprint&trade;  back-mounted fingerprint<br>\r\nsensor for fast unlocking<br>\r\nBarometer<br>\r\nAndroid Sensor Hub<br>\r\nHaptics<br><br>\r\n\r\n* Requires internet connection', 'Charging<br>\r\nUSB-C&trade; 18W adapter with USB-PD 2.0<br>\r\n18W fast charging *<br><br>\r\n\r\n*Charging rates are based upon use of the included charger. Actual results may vary.', 'In the box<br>\r\n18 W USB-CTM power adaptor<br>\r\n1 m USB-C to USB-C cable (USB 2.0) Quick start guide<br>\r\nQuick Switch Adaptor<br>\r\nSIM tool', 'OS + Assistant<br>\r\nThe latest Android 9.0 Pie + Google Assistant with Lens', 'Pixel\'s extraordinary camera, for all your moments', 'Charges fast. Lasts all day', 'Do more with the Google Assistant', '', ''),
(3, 3, '6.5-inch Super Retina OLED display with HDR1', 'IP68 dust and water resistance (maximum depth of 2 metres for up to 30 minutes)', '12-megapixel dual cameras with dual optical image stabilisation and 7-megapixel TrueDepth front camera - Portrait mode, Portrait Lighting, Depth Control and Smart HDR', 'Face ID for secure authentication and Apple Pay', 'A12 Bionic with next-generation Neural Engine', 'Wireless charging - works with Qi chargers', 'iOS 12 with Memoji, Screen Time, Siri Shortcuts and Group FaceTime', 'Legal<br>\r\n1The display has rounded corners. When measured as a rectangle, the iPhone XS Max screen is 6.46 inches diagonally. Actual viewable area is less. <br><br>\r\n2iPhone XS Max is splash-, water- and dust-resistant, and was tested under controlled laboratory conditions with a rating of IP68 under IEC standard 60529 (maximum depth of 2 metres for up to 30 minutes). Splash, water and dust resistance are not permanent conditions, and resistance might decrease as a result of normal wear. Do not attempt to charge a wet iPhone; refer to the user guide for cleaning and drying instructions. Liquid damage is not covered under warranty. <br><br>\r\n3Qi wireless chargers are sold separately.<br><br>\r\n4Group FaceTime will be available in iOS 12 later this year through a software update.', '6.5-inch Super Retina OLED display with HDR', 'IP68 dust and water resistance (maximum depth of 2 metres for up to 30 minutes)', '12-megapixel dual cameras with dual optical image stabilisation', '', '', ''),
(4, 4, '4.7-inch Retina HD display with True Tone', 'All-glass and aluminium design; water and dust resistance', '12-megapixel camera with OIS and 4K video up to 60 fps', '7-megapixel FaceTime HD camera with Retina Flash for stunning selfies', 'Touch ID for secure authentication and Apple Pay', 'A11 Bionic, the smartest and most powerful chip in a smartphone', 'Wireless charging - works with Qi chargers', '', '', 'All-glass design', 'Advanced cameras', 'A11 Bionic chip', 'Wireless charging', ''),
(5, 5, '12MP Super Speed Dual Pixel camera with Super Slow-mo up to 960fps', '5.8\" Infinity Display with Quad HD+ resolution', 'Stereo speakers with Dolby Atmos', 'Water and dust resistant (IP68)', '256GB storage', 'Secure iris and face recognition technology', 'Fast wired and wireless charging', 'New 10nm Octa Core chip', '', '12MP Super Speed camera with Super Slow-mo', '5.8\" Quad HD+ Infinity Display', 'Dual Stereo speakers', '', ''),
(6, 6, '6.1\" Quad HD+ Infinity-O display with HDR10+', '8GB RAM', '128GB storage', 'Triple rear camera with ultrawide lens', '10MP front camera', 'Ultrasonic in-display fingerprint', 'Share your power with wireless PowerShare', 'Long lasting 3,400 mAh (typical) battery', 'Water and dust resistant (IP68)', '6.1\" Infinity-O display', 'Triple rear camera', 'Wireless PowerShare', '', ''),
(7, 7, '6.2\" HD+ waterdrop screen', '64GB storage', '3GB RAM', '8MP front facing camera', '13MP + 2MP rear camera', '4230mAh Battery', 'Dual Rear Camera & AI Beauty', 'ColorOS 5.2.1', '', '6.2\" HD+ waterdrop screen', '8MP front facing camera', '13MP + 2MP rear camera', '', ''),
(8, 8, '6.4\" AMOLED 1080 x 2340 screen', 'MTK Helio P90 processor', '8GB RAM', '128GB storage', '32MP front facing camera', '48MP + 5MP dual rear camera setup', '4035mAh battery + VOOC 3.0', 'Bluetooth v5.0', 'ColorOS 6 (based on Android 9)', '48MP + 5MP dual rear camera', '32MP front facing camera', '4035mAh battery with VOOC 3.0', '', ''),
(9, 9, '5.84\" Full HD+ display', '2280 x 1080 pixels', 'Kirin 659 CPU  4 X 2.36GHz + 4*1.7GHz', '4GB RAM', '64GB Storage', 'Expandable memory up to 128GB (via MicroSD card)', '16MP + 2MP dual rear cameras AF with Flash', '16MP front camera', '3000mAh Battery with fast charging, Type C', '16MP + 2MP dual rear cameras', '3000mAh Battery with fast charging', 'Face Unlock', '', ''),
(10, 10, '6.47\" Huawei FHD+ OLED Display plus in-screen fingerprint sensor', 'AI-powered Leica Quad Camera System with Huawei SuperSpectrum Sensor , Ultra-Wide Angle and SuperZoom Lens', 'Main camera: 40 Megapixel + 20MP + 8MP sensor;Front camera: 32MP', 'High speed wireless charging compatible | Reverse wireless charging capable', '256GB built-in memory', 'IP68-rated and completely dustproof and water-resistant up to 1.5m', 'Dual 4G SIM Card Slots: gives you more work and play whether home or abroad', 'Kirin980 dual AI 7nm processor', 'Android 9.0 featuring EMUI 9.1', 'Shoot like a pro with AI-Powered Leica Quad Camera System', 'Record the never-before-seen with SuperZoom lens', 'See the splendor hidden in the dark thanks to SuperSpectrum Sensor', '', ''),
(11, 11, '6\" QHD+ OLED FullVision Display<br>\r\nSee More, Hold Less<br>\r\nThe LG OLED display has breathtaking colour accuracy, and incorporates plastic for higher flexibility. Combined with FullVision technology, the LG V30+ 6” display makes your viewing experience a real treat.¹', 'F1.6 Crystal Clear Lens<br>\r\nSuperb Sharpness and Colour<br>\r\nThe main camera on the LG V30+ features an F1.6 aperture and a glass lens, resulting in impressive low-light performance and improved colour clarity.', 'Cine Video Mode<br>\r\nBe Your Own Director<br>\r\nCapture the professional film look. Cine Video Mode gives you vivid colours and a great range of effects to suit your film making needs.', 'Point Zoom<br>\r\nTotal Zoom Control<br>\r\nLights, Camera, Zoom! Preset zoom speed, location, and motion for a shot straight out of the movies. Smooth and controlled Point Zoom lets you shoot high quality videos using the main camera.', 'Wide Angle Cameras<br>\r\nCapture the Bigger Picture<br>\r\nCapture brilliant shots with the wide-angle front and rear cameras. Great for group shots or landscapes. Take amazing selfies with the front wide-angle camera.', 'Wide Angle Cameras<br>\r\nCapture the Bigger Picture<br>\r\nCapture brilliant shots with the wide-angle front and rear cameras. Great for group shots or landscapes. Take amazing selfies with the front wide-angle camera.', 'Stream Sweet Sounds<br>\r\nHi-Fi Quad DAC Audio<br>\r\nGet awesome sound with the LG V30+ Hi-Fi Quad DAC. Stream sound in our highest quality yet.', 'Premium Listening<br>\r\nTuned to Your Taste<br>\r\nHave your audio tuned the way you want it. Tweaked and adjusted to your tastes and environment, the LG V30+ Preset Sounds and Digital Filters add professional reference sounds so you can enjoy rich, full music at home or on the go.', 'Voice / Face Recognition<br>\r\nAlways Knows It\'s You<br>\r\nThe LG V30+ facial recognition technology helps you unlock your phone quick and easy, without swiping or inputting numbers. It\'s enhanced voice recognition technology can recognise and be set to respond only to your voice.', '6\" QHD+ OLED FullVision&trade; Display', 'F1.6 Crystal Clear Glass Lens', 'Cine Video Mode', '', ''),
(12, 12, '6.4\" OLED QHD+ FullVision display', '3120 x 1440 Resolution', '6GB RAM', '128GB Storage', 'Qualcomm SDM845 Snapdragon 845', '5 Cameras <br>\r\nRear Camera 1: 12MP Standard with low light mode (F1.5 / 78°)<br> \r\nRear Camera 2: 16MP Ultra-Wide Angle (F1.9 / 107°) <br>\r\nRear Camera 3: 12MP Telephoto with 2 x Optical Zoom (F2.4 / 45°)<br>\r\nFront Camera 1: 8MP Standard with low light mode<br>\r\nFront Camera 2: 5MP 90° Wide Angle<br><br>\r\n\r\nTriple preview/shot', 'AI assisted', 'DTS: X 3D surround sound & boombox speaker', '32Bit Quad Hi-Fi DAC', '6.4\" OLED FullVision&trade; Display', '5 Cameras inc. Telephoto', 'Triple Preview/Shot', '', ''),
(13, 13, 'Display<br>\r\n6.18 inch display <br>\r\nFHD  1080 x 2280<br>\r\n18.7:9<br>\r\nPureDisplay (HDR10, DCI-P3, 500 nits, 96% 00 nits, 96% colour gamut)', 'Design<br>\r\nColors Blue/Silver<br>\r\nSize (excluding camera) 154.8 x 75.76 x 7.97 mm<br>\r\nWeight 180g', 'Processors<br>\r\nQualcomm® Snapdragon™ 710<br>\r\n8 x Qualcomm Kryo 360 CPU up to 2.2GHz<br>\r\nOperating system Android 9 Pie[5]<br>\r\nRAM 4 GB LPPDDR4x', 'Network and connectivity<br>\r\nNetwork speed LTE Cat. 6, 2CA, L+L, VoLTE, VoWiFi\r\nWiFi 802.11 b/g/n/ac<br>\r\nBluetooth® 5.0<br>\r\nGPS/AGPS+GLONASS+Beidou', 'Camera<br>\r\nPrimary camera Dual Main: <br>\r\n12 MP 1/2.55’’, 1.4um pixels, OIS 2PD, \r\nDual second: 13 MP FF\r\nFront-facing camera 20 MP FF/0.9um<br>\r\nFlash Dual Hi-Cri flash', 'Audio<br>\r\nConnector 3.5 mm headphone jack<br>\r\nSpeakers Single speaker with smart amplifier<br>\r\nRecording Nokia OZO surround sound capture', 'Battery life<br>\r\nBattery type Integrated 3500 mAh[4] battery<br>\r\nCharging 18 W fast charging', 'Storage<br>\r\nInternal memory 64 GB[3] e-MMC 5.1<br>\r\nMicroSD card slot Support for up to 400 GB', 'Connections and sensors<br>\r\nCable type USB Type-C 2.0 cable<br>\r\nAmbient light sensor <br>\r\nProximity sensor<br>\r\nAccelerometer (G-sensor)<br>\r\nE-compass<br>\r\nGyroscope<br>\r\nFingerprint sensor (rear) <br>\r\nNFC', 'Google designed OS + Latest Android 9 Pie', 'Up to 2-days charge with Adaptive Battery', 'Advanced-AI dual camera with 20MP selfie camera', '', ''),
(14, 14, 'World’s first 5-camera array with ZEISS optics, in a phone made for photographers.<br>\r\nThe industry defying camera captures DSLR-quality depth of field and 10 x more light than single-colour sensors[1]. All 5 of the 12MP cameras shoot simultaneously - with 3 monochromatic sensors for sharpness and 2 colour sensors. So, whether you’re a photographer or enthusiast you can now shoot photos on your phone with unparalleled dynamic range.', 'Advanced editing in Adobe Photoshop Lightroom. Anywhere. <br>\r\nA powerful camera deserves professional editing software. Download Adobe Photoshop Lightroom and get ready for shooting and editing RAW photos on your phone, retaining incredible amounts of detail from the 1200+ layers captured by Nokia 9 PureView.', 'PureDisplay with in-screen fingerprint unlock<br>\r\nThe 5.99” PureDisplay with HDR10 support is a pleasure for the senses, delivering a stunning cinematic experience on the go - even upscaling non-HDR content in real-time. Plus, enjoy a new way to unlock your phone with the in-screen fingerprint sensor or by using advanced biometric face unlock. The choice is yours.', 'Latest Google innovations<br>\r\nWith Android 9 Pie out-of-the-box you can unleash the power of AI with smart features including Adaptive Battery and Digital Wellbeing. Better still, with Android One you get a pure Android experience designed by Google that stays ahead of the game thanks to 2 years of guaranteed OS upgrades and 3 years of security patches.', 'App Actions – Exclusive to Android One and Google Pixel\r\nApp Actions with Android 9 Pie predicts what you want to do, so you can get to your next task more quickly. Your phone will adapt automatically to your morning commute, while you’re at work or relaxing on the weekends.', 'Your built-in Google Assistant<br>\r\nJust start with ‘Hey Google’ or hold the Home button. Ask it questions or tell it to do things with smart devices and other Google services. It’s your own personal Google, always ready to help.', 'Turn one photo into countless stories <br>\r\nNokia 9 PureView with its depth-of-field, lets you refocus on alternative areas of an image, even after you’ve taken the photo. Rediscover and create unique-looking photos just by changing the focus from the kids, to the food, to the family dog. You also get free unlimited high-quality storage with Google Photos, so you don’t have to worry about running out of space.', 'Take creative control and unleash your inner Artist. <br> \r\nThe next-gen Pro Camera mode lets you take ultimate control by making real-time adjustments on the fly - including exciting time-lapse photography with exposure times up to 10 seconds. For the added artistic touch, you can also shoot in Native Monochrome for incredibly atmospheric shots.', 'AI-Advanced 20MP front camera<br>\r\nEven photographers take Selfies, and with the power of AI its like having your own portrait studio. Capture stunning Selfies with Portrait Lighting and Beautify, or get the bokeh-style effect of DSLR cameras by artfully blurring the background. And even though Nokia 9 PureView takes photography seriously there’s always room for fun with 3D masks/filters and #bothies.', 'World’s first 5-camera array with ZEISS optics', 'Captures 1200+ layers of depth - more than any previous smartphone', 'Advanced editing of RAW/DNG photos to retain the finest detail', 'Google designed OS + latest AI innovations', ''),
(15, 15, 'Accessory type - Portable power', 'Colour - Black', 'Battery capacity (mAh) - 5100', 'Manufacturer\'s warranty - 2 Years', '', '', '', '', '', 'Charge up to 2 devices simultaneously', 'Up To 250 Hours extra Operation Time', '5100mAH x 2 Battery Capacity', '', ''),
(16, 16, 'Accessory type - Portable power', 'iPhone compatible - Yes', 'Colour - Black', 'Battery capacity (mAh) - 10000', 'Manufacturer\'s warranty - 2 Years', '', '', '', '', 'Up to 52 additional hours of smartphone battery life', 'Charge 2 smartphones at once', 'Compact, pocket friendly form factor', '', ''),
(17, 17, 'Accessory type - Cables', 'Cable primary use - Phone', 'Phone Compatibility - Universal', 'Colour - White', 'Cable type - USB-C', 'Phone Cable Type - USB-C', 'Manufacturer\'s warranty - 1 Year', '', '', '2-in-1 connection', 'Length 1.5m', 'Type-C and Micro USB', '', ''),
(18, 18, 'Accessory type - Cables', 'Cable primary use - Phone', 'iPhone compatible - Yes', 'Phone Compatibility - iPhone/iPad/iPod (Lightning)', 'Made for iPhone/iPod/iPad - True', 'Colour - Gold', 'Cable type - Lightning', 'Material - Nylon', 'Phone Cable Type - Apple Lightning', 'Kevlar-reinforced conductors provide added durability', 'Double-braided nylon forms flexible, durable cable jacket', 'Longer, flexible strain relief absorbs stress from bending to prevent breakage', '', ''),
(19, 19, 'Accessory type - Chargers wired', 'Colour - White', 'Manufacturer\'s warranty - 1 Year', '', '', '', '', '', '', 'Built-in protection against over heating and short circuits', 'Vertical or Horizontal set up', 'Total power Output 7.8A/39W', '', ''),
(20, 20, 'Accessory type - Chargers wireless', 'iPhone compatible - Yes', 'Phone Compatibility - Universal', 'Colour - Black', 'Manufacturer\'s warranty - 2 Years', '', '', '', '', '5W Qi-certified wireless charging', 'Case compatible up to 3mm', 'Universal compatibility', '', ''),
(21, 21, 'Accessory type - Surge protection', 'Phone Compatibility - Samsung Galaxy S10', 'Colour - Clear', '', '', '', '', '', '', 'Self-regenerative coating', 'Bubble-free Installation', 'Perfect clarity and adhesion', '', ''),
(22, 22, 'Accessory type - Screen protection', 'Phone Compatibility - Google Pixel 3', 'Colour - Clear', 'Material - Glass', 'Manufacturer\'s warranty - 1 Year', '', '', '', '', 'Edge to edge curved shape for precise fit to your devices screen', '9H hardness protection – a high level of scratch protection', 'Oleophobic coating gives barrier protection against water and oil with an easy clean finish', '', ''),
(23, 23, 'Accessory type - Cases/covers', 'iPhone compatible - Yes', 'Phone Compatibility - iPhone XS Max', 'Colour - Black', 'Case type - Tough', 'Manufacturer\'s warranty - 1 Year', '', '', '', 'Submersible 2 metres for 1 hour', 'Survives drops from 2 metres', '360° protection built-in screen-cover', '', ''),
(24, 24, 'Accessory type - Cases/covers', 'iPhone compatible - No', 'Phone Compatibility - Google Pixel 3', 'Colour - Clear', 'Case type - Snap on', 'Manufacturer\'s warranty - Lifetime', '', '', '', 'Clear, slim phone case resists discoloring and provides 8-foot drop protection', 'Two layers of premium protection against drops and scratches', 'Newly developed coating helps to prevent discoloration', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `productId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`productId`, `customerId`, `rating`) VALUES
(1, 1, 1),
(1, 25, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `customerId` int(11) NOT NULL,
  `productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`customerId`, `productId`) VALUES
(1, 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessory`
--
ALTER TABLE `accessory`
  ADD PRIMARY KEY (`accId`);

--
-- Indexes for table `accessorysupport`
--
ALTER TABLE `accessorysupport`
  ADD KEY `accId` (`accId`),
  ADD KEY `productId` (`productId`),
  ADD KEY `supportedPID` (`supportedPID`);

--
-- Indexes for table `accessory_product`
--
ALTER TABLE `accessory_product`
  ADD KEY `accId` (`accId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `cartId` (`customerId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `customerId` (`customerId`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD KEY `orderId` (`orderId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentId`),
  ADD KEY `orderId` (`orderId`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`pictureId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `catagoryId` (`catagoryId`);

--
-- Indexes for table `productdetail`
--
ALTER TABLE `productdetail`
  ADD PRIMARY KEY (`detailId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD KEY `productId` (`productId`),
  ADD KEY `customerId` (`customerId`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD KEY `customerId` (`customerId`),
  ADD KEY `productId` (`productId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accessory`
--
ALTER TABLE `accessory`
  MODIFY `accId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `pictureId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `productdetail`
--
ALTER TABLE `productdetail`
  MODIFY `detailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accessorysupport`
--
ALTER TABLE `accessorysupport`
  ADD CONSTRAINT `accessorySupport_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accessorySupport_ibfk_2` FOREIGN KEY (`accId`) REFERENCES `accessory` (`accId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accessorySupport_ibfk_3` FOREIGN KEY (`supportedPID`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `accessory_product`
--
ALTER TABLE `accessory_product`
  ADD CONSTRAINT `accessory_product_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accessory_product_ibfk_2` FOREIGN KEY (`accId`) REFERENCES `accessory` (`accId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order_product` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pictures`
--
ALTER TABLE `pictures`
  ADD CONSTRAINT `pictures_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`catagoryId`) REFERENCES `category` (`categoryId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productdetail`
--
ALTER TABLE `productdetail`
  ADD CONSTRAINT `productDetail_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
