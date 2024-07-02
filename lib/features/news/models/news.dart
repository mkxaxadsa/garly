class CarouselNews {
  final String title;
  final String imgUrl;

  CarouselNews({
    required this.title,
    required this.imgUrl,
  });
}

List<CarouselNews> carouselNews = [
  CarouselNews(
    title: 'Yacht vs Boat: What\'s the Difference Between the Two?',
    imgUrl:
        'https://iqboatlifts.com/wp-content/uploads/2018/06/Yacht-vs-Boat-Whats-the-Difference-Between-the-Two.jpg',
  ),
  CarouselNews(
    title: '10 Reasons to Buy a Boat Lift',
    imgUrl:
        'https://iqboatlifts.com/wp-content/uploads/2019/08/Decked-6-1024x768.jpg',
  ),
  CarouselNews(
    title: 'Twisted Marine rescues iconic British brand Scorpion RIBs',
    imgUrl:
        'https://keyassets.timeincuk.net/inspirewp/live/wp-content/uploads/sites/18/2024/06/Twisted-Scorpion-920x518.jpg',
  ),
  CarouselNews(
    title: 'Focus Motoryachts teases new 3X boat ideal for bathing',
    imgUrl:
        'https://keyassets.timeincuk.net/inspirewp/live/wp-content/uploads/sites/18/2024/06/3X-920x518.jpg',
  ),
];

class News {
  final String imgUrl;
  final String title;
  final String date;
  final String body;

  News({
    required this.imgUrl,
    required this.title,
    required this.date,
    required this.body,
  });
}

List<News> news = [
  News(
    imgUrl:
        'https://keyassets.timeincuk.net/inspirewp/live/wp-content/uploads/sites/18/2024/06/Twisted-Scorpion-920x518.jpg',
    title: 'Twisted Marine rescues iconic British brand Scorpion RIBs',
    date: '19.06.2024',
    body:
        'In a significant development for the British boating community, Twisted Marine has acquired Scorpion RIBs, a well-known manufacturer of high-performance rigid inflatable boats (RIBs).\n\nThe acquisition follows Scorpion RIBs\' entry into administration earlier this year, ensuring the preservation and continuation of this iconic British brand.\n\nFounded in 1996, Scorpion RIBs has earned a strong reputation for producing advanced and reliable RIBs, holding more endurance and race records than any other manufacturer.\n\nThe company\'s future was uncertain after it went into administration in early 2024. However, the acquisition by Twisted Marine will bring renewed stability and optimism to Scorpion\'s loyal customer base and RIB enthusiasts worldwide.\n\nCharles Fawcett, Founder of Twisted Automotive and Twisted Marine, commented on the acquisition: “We are excited to bring Scorpion RIBs into the Twisted family. Scorpion RIBs is known for quality, innovation, and performance, which align with our own values. By revitalising Scorpion RIBs, we are preserving a great brand and exploring new opportunities for growth.”',
  ),
  News(
    imgUrl:
        'https://keyassets.timeincuk.net/inspirewp/live/wp-content/uploads/sites/18/2024/06/3X-920x518.jpg',
    title: 'Focus Motoryachts teases new 3X boat ideal for bathing',
    date: '17.06.2024',
    body:
        'Focus Motoryachts\' 3X has a generous full-beam bathing platform, an aft island sun pad and a choice of booth dining amidships.\n\nThe front end of the cockpit provides twin bucket seats, one for the driver on the centreline, and a passenger to port.\n\nThe two long windows on both sides of the cockpit drop down at the touch of a button and the sunroof above slides back, so the cockpit can be opened up to or closed off from the elements as and when required.',
  ),
  News(
    imgUrl:
        'https://cdn.boatinternational.com/convert/files/2024/06/6a66c750-32fd-11ef-a68a-7db71d6da289-Ravenger%20on%20sea%20trials.jpg/r%5Bwidth%5D=1920/6a66c750-32fd-11ef-a68a-7db71d6da289-Ravenger%20on%20sea%20trials.webp',
    title:
        '54m Baltic 175 Ravenger completes sea trials following "transformational refit"',
    date: '25.06.2024',
    body:
        'Previously known as Pink Gin VI,  Baltic Yachts\' 53.9-metre sailing yacht Ravenger has successfully completed sea trials in Jakobstad after relaunching following an eight-month refit at the yard\'s Jakobstad facilities.\n\nHer exterior styling was penned by the owner\'s team, including Finnish designer Jarkko Jämsén. Her regular maintenance and refit schedule has kept her in class, so the refit works have been largely aesthetic and performance-enhancing. This comprised major upgrades to her rig, sailplan and sailing systems. Design Unlimited is responsible for the reimagined interiors, including a restyled owner\'s cabin.\n\nDesigned by Judel/Vrolijk & Co and Design Unlimited, the 325GT yacht is a regular on the regatta circuit thanks to her lightweight carbon construction and is often seen flying a pink spinnaker on the water. Her mast has been rebuilt to support a more powerful sailplan with a square-top mainsail and a triple headsail configuration, plus larger code and offwind sails.\n\nFurther modifications include her bowsprit which has been extended by 1.5 metres, a replaced headstay and her running backstays which have now been fitted with deflectors.\n\nIn terms of her exterior restyle, Ravenger now has a hardtop Bimini that shelters the midships passenger cockpit (styled by Jarkko Jämsén). Alterations are also being made to the helm stations, including modernising the ergonomics and style of the control console and adding an additional helmsman\'s Bimini set on a carbon fibre tubular framework.\n\nMeanwhile, her new interiors incorporate softer, neutral tones and light oak veneers on surfaces, including headboards and tabletops.\n\n',
  ),
  News(
    imgUrl:
        'https://cdn.boatinternational.com/convert/files/2023/05/5eaa0680-f649-11ed-9172-479df397d51c-M26-exterior.jpg/r%5Bwidth%5D=1920/5eaa0680-f649-11ed-9172-479df397d51c-M26-exterior.webp',
    title: 'Second 26m Aegean Explorer Hekate launched',
    date: '26.06.2024',
    body:
        'Bodrum-based shipyard Aegean Yacht has launched the second unit in its 26-metre Aegean Explorer series and christened it Hekate.\n\nThe 187GT explorer yacht is built in steel and aluminium and has been designed and engineered entirely in-house as a "go-everywhere" yacht. The yacht boasts a simple exterior with a dual-tone paint job disguising her height and volume.\n\nStandard accommodation configuration allows for 12 guests in six cabins including three "full-beam master suites". Guests can make the most of external areas including the bridge deck forward and aft of the sky lounge. The aft deck and swimming platform also provide comfortable spaces to relax.\n\nIn a social media post, the yard stated: "Proud to present our newest beauty, the Aegean Explorer! This 26-meter masterpiece is the result of incredible teamwork and dedication. A huge thank you to our amazing Aegean Yacht Team who made this dream a reality. Here\'s to many more adventures on the horizon."\n\nHekate is currently for sale with Denison Yachting. The first hull, named Ukiel, was delivered in November 2023.',
  ),
  News(
    imgUrl:
        'https://cdn.boatinternational.com/convert/files/2024/06/e5fccf40-32fd-11ef-9c65-9f2c0e15f839-Eternal-Spark-delivered.jpg/r%5Bwidth%5D=1920/e5fccf40-32fd-11ef-9c65-9f2c0e15f839-Eternal-Spark-delivered.webp',
    title: 'Bilgin Yachts\' 50m Eternal Spark delivered',
    date: '25.06.2024',
    body:
        'Bilgin Yachts\' 50-metre Eternal Spark has been delivered and is now available for charter. She will make her premiere during the Monaco Yacht Show 2024.\n\nConstruction on the Bilgin 163 model began in December 2019, with the model sold in 2022 by SuperYachts Croatia. Featuring a sporty yet elegant exterior design from Unique Yacht Design and interiors by Hot Lab, the yacht builds on the success of the shipyard\'s smaller models such as Moonraker (formerly Snow 5) and Starburst III.\n\nBuilt with the charter market in mind, entertainment is at the core of its design. Eternal Spark will be able to host more than 100 guests quayside across her four expansive, open-plan decks, with five separate bars and six outdoor social areas.\n\nEmrecan Özgün of Unique Yacht Design said her exterior spaces "surpass those of its predecessors, lending a sportive appearance to Bilgin 163."\n\nThere is also a generous 21-metre sundeck featuring a huge Jacuzzi, a 12-metre bridge deck aft, and a spacious main deck aft. Özgün said: "This provides a direct connection to the beach club and close proximity to the sea, all without making the exterior design appear bulky.”\n\nInteriors are the work of Milan-based studio Hot Lab and feature more than 60 natural finishes, including 14 different marbles. Accommodation is for 12 guests with a six-cabin layout. "Each stateroom is a little bit different in its colour combinations," explained Enrico Lumini, partner and head of design at Hot Lab. "From the yellowish stones, to the pinkish quartz, we wanted to ensure that the design stayed fresh and colourful, without an overwhelming use of colour. It is not too beige, but light, fresh and sunny – comparable to a villa on the Côte d\'Azur.”\n\nOther notable design highlights include a full-height round glass wall that divides the main saloon and lobby, where you can find a giant chandelier, a floating staircase and a skylight on the sundeck floor. A standout feature is the yacht\'s sunken-level beach club, which features a sauna, an ice fountain, a day head and a lounge with a wet bar. Also among her many highlights are an outdoor and indoor cinema.',
  ),
  News(
    imgUrl:
        'https://keyassets.timeincuk.net/inspirewp/live/wp-content/uploads/sites/18/2024/06/MBY298.newboat_4.TechnohullAlpha699-920x518.jpg',
    title:
        'The new Technohull Alpha 50 is a high performance RIB, that will deliver some comfort in addition to significant performance',
    date: '26.06.2024',
    body:
        'The Technohull Alpha 50 is Technohull\'s new flagship and should be everything fans of the Greek brand would want it to be. As an established builder of rapid, swell-cleaving performance RIBs with stepped hulls and prodigious power, the Alpha 50 needs to be a proper sports machine and it really is.\n\nYou can spec the Technohull Alpha 50 with twin inboard diesels if you like but most buyers will look to take advantage of a transom that can accommodate anything from two to five outboard engines for performance nudging up toward the 90-knot mark.To help you enjoy that to the utmost, there\'s space for two triple rows of shock-absorbing seats behind the raked screen, alongside a sleek, aerodynamic hardtop and an unusual semi-straight, wave-piercing bow.\n\nThe generous helm means access to the cabin\'s large double bed and separate heads and shower compartment is achieved by means of a pantographic door at the side of the console. But there\'s also the option of a second \'cabin\' beneath the bow deck\'s forward sunbed; and there\'s still masses of deck space, including a broad aft cockpit with multiple layout options.',
  ),
  News(
    imgUrl:
        'https://keyassets.timeincuk.net/inspirewp/live/wp-content/uploads/sites/18/2024/05/MBY298.newboat_2.LanciaApreaI4143b-920x517.jpg',
    title:
        'The Lancia Aprea 52 is a a new launch, but one which harkens back to 1950s movie star glamour. Hugo Andraea takes a quick look',
    date: '27.06.2024',
    body:
        'What about this then? Described by Cantieri Aprea as a \'neo classic\' and \'a contemporary work of art\', the Lancia Aprea 52 is based squarely on the builder\'s iconic Lancia Sorrentina, which was a popular means of transport for 1950s movie stars in and around the fabled cruising grounds of Sorrento and Capri.\n\nBut while the new boat might be Aprea\'s attempt to re-voice the \'golden age\' of Italian boating, this new model – the first in a new range of luxurious yachts that will run from 32 to 72 feet – actually seems to have raised the game from a stylistic perspective.\n\nWith its beamy tumblehome stern, fine entry and flamboyant bow flare, it\'s a great looking boat and it\'s made all the better by sumptuous teak and steel trim that looks every bit as generous as the hull windows are modest.\n\nIn terms of layout, there are two chief versions available. You can opt for the Family variant, with a forward owner\'s suite, a pair of mid twins and a couple of heads compartments. Or you can sacrifice the third (port) cabin for the lower lounge and extra utility space of the Cruising variant.All versions are highly customisable in terms of colours, materials and finishes and there\'s plenty of flexibility in terms of performance too. If you\'re happy with a gentlemanly 32 knots, you can pick between a pair of MAN i6-800 diesel engines on straight shafts or Volvo Penta D8 IPS-800s.\n\nAnd if you don\'t mind disrupting those lovely lines with a set of muscular cowlings, the American version of the Aprea 52 comes with a quad rig of Mercury Verado 600 outboards, putting 50 knots firmly within reach.\n\nIf, on the other hand, you favour modesty over ostentation, you\'ll be pleased to know that the display model at Cannes in September will be the Med-style Family model.\n\nThe main deck will be optimised for open-air fun with large sunbeds fore and aft, plus a fully equipped bar and a relaxed sofa beneath the shade of a large integrated hardtop. And the fit-out will be suitably classy, with a \'Blu Vervece\' hull (pictured) and internal bulkheads adorned with milky white herringbone fabric by Loro Piana.',
  ),
  News(
    imgUrl:
        'https://keyassets.timeincuk.net/inspirewp/live/wp-content/uploads/sites/18/2024/05/MBY298.newboat_1.QUARKEN35TTOPwater_002-1-920x518.jpg',
    title: 'Quarken 35 T-Top first look: Open-plan with pilothouse echoes',
    date: '15.05.2024',
    body:
        'Due for its public unveiling at the Cannes Boat Show in September, the new Quarken 35 T-Top boat will use an identical lower deck. That will provide an open-plan forward owner\'s cabin, plus a port heads compartment and a starboard bench that can be rigged as an extra guest berth for an adult or two kids without the fuss of separate infills.\n\nIn spite of its open layout, the T-Top\'s deck furniture also echoes that of the pilothouse arrangement. There\'s a fore-and-aft galley to port, opposite a raised dining station that makes good use of reversible backrests at the twin helm.\n\nBut in this case, the absence of bulkheads enables the primary entertaining zone to extend further aft, where it integrates neatly with a bench seat at the leading edge of a large cockpit sunbed.\n\nThere are neat two-man seats built into the bulwarks on both sides to help increase the sociability of the aft cockpit without obstructing the deck space and there\'s plenty of room inside the central sunbed for watersports gear, so you don\'t necessarily have to mount it on the Quarken 35 T-Top.\n\nThe bow also looks very attractive. As on the Cabin model, it features a three-person lounger orbited by safe walkaround decks, as well as a broad step-through forepeak that can also be used as the forward part of an additional five-person bow lounge.\n\nThis is clearly designed to feel more like a Med boat than a four-season utility vessel, but if the style of the open layout and the swept (rather than reverse) screen reinforce that difference, the performance ought to be much the same.\n\nDesigned and built in Finland using vacuum infusion and a twin-stepped hull for maximum cruising efficiency, the 35 T-Top will come with a pair of Yamaha\'s 4.2L V6 300hp outboards for speeds in the region of 45 knots.',
  ),
  News(
    imgUrl:
        'https://keyassets.timeincuk.net/inspirewp/live/wp-content/uploads/sites/18/2024/05/MBY298.news_.Azimut_Grande_44M_1-920x518.jpg',
    title: 'Azimut Grande 44 Metri trideck first look',
    date: '14.06.2024',
    body:
        'Azimut has released the first renderings of its biggest-ever model, the all-new Grande 44 Metri trideck. The exterior design is by Azimut-regular Alberto Mancin while Azimut brought in M²Atelier for the interior.\n\nDespite its size, this 143ft 10in (43.85m) Azimut will have a composite construction featuring plenty of carbon fibre in the upper structures to help keep the centre of gravity low.\n\nA \'dual mode\' hull developed by Pierluigi Ausonio and Azimut\'s in-house team that claims to deliver efficient fast-displacement running at slow to medium speeds with full planing performance higher up the rev range.\n\nA hull vane foil below the transom, developed by Dutch naval architects, Van Oossanen, will generate additional lift, improving speed and fuel efficiency even further.\n\nThe layout is equally innovative with the helm station positioned on a semi-enclosed fourth deck, leaving the upper deck free to become a private owners\' deck, comprising an enormous master suite with direct access to its own aft terrace.\n\nFull details of the powertrain have not yet been disclosed but we do know it will include a mild hybrid system that allows a zero-emissions mode capable of handling the hotel loads when anchoring overnight.\n\nDespite the hull number still being two years away from completion, Azimut says five have already been sold off plan.',
  ),
  News(
    imgUrl:
        'https://keyassets.timeincuk.net/inspirewp/live/wp-content/uploads/sites/18/2024/04/MBY297.newboat_4.Zeelander803-920x518.jpg',
    title:
        'Zeelander 8 first look: painstaking attention to detail and refinement',
    date: '17.05.2024',
    body:
        'The new flagship of the ultra-exclusive Zeelander fleet looks precisely how you would anticipate. Cue an understated orgy of mellow lobster boat lines with barely a straight line in sight.\n\nCue lots of painstaking attention to detail and an obsessive focus on refinement. And cue the same lovely extendable tumblehome transom that we\'ve seen onthe Dutch brand\'s smaller boats.\n\nIn terms of the practicalities, preliminary drawings suggest that it will offer three double cabins and space for up to three crew, as well as a drive-in tender garage which builds on the system developed for the Zeelander 6 and 7.\n\nThere will be added flexibility at the bow too, thanks to a deep-set transverse lounge ahead of the extravagantly swept screen. And in spite of its sheer scale, a quad rig of top-spec D13 IPs-1350s will see this boat to 40 knots while keeping sound levels in the saloon beneath just 72dBa.\n\nThe first boat is due for delivery this summer and if precedent is anything to go by, the only thing more astonishing than its aesthetic loveliness is likely to be the sheer scale of its \'billionaire-baiting\' price…',
  ),
];
