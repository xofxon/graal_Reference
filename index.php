<?php
header("Cache-Control: no-cache, must-revalidate"); // HTTP/1.1
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT"); // Date du passé
if ( strpos($_SERVER['HTTP_USER_AGENT'], 'Gecko') ) {$_oncontinue="oui";} else {$_oncontinue="non";}
switch (TRUE) {
  case $_oncontinue=="non" || $_oncontinue=="jesaispas":
    include('./exploit/pagesparticulieres/index_ie.inc.php');
    break;
  case $_oncontinue=="oui":
    $toto=$_GET['q'];
    if ($toto=="") {header("Location: http://www.lemonde.fr");exit;}
		switch ($toto) {
			case "4d4ab245-6f5f-4e4f-bdb9-6f02110bea42":
			case "0dc9f59f-9563-4dd3-a579-243f362ce877":
			case "9912aae1-37ee-480c-b96d-4c41cf07c438":
			case "17203d73-2439-483d-aacf-bed23d78cab9":
			case "e5929d28-5f61-4d08-a422-47b6ef974326":
			case "01a873fd-2b79-49c9-aa8b-7251b274a8d1":
			case "18cd7145-c8eb-440d-9055-5505136988b4":
			case "d24711fb-e3df-4703-9cb1-661c3ecc08fa":
			case "cb95e9b8-7d6a-41ce-a7c7-47af75226043":
			case "75457813-665c-4e5c-96dd-75d697f7d819":
			case "1658fbf7-11d9-4725-83d0-e0675f3b03d2":
			case "8f0434f9-52ae-4604-bcb0-dbaade33ba02":
			case "d311c8d9-93e3-45f5-86c0-3d144a18de92":
			case "11a2d7a0-68bb-4611-b23c-febfd62b6777":
			case "57a1025a-8c14-45b4-b93f-e37825b363a8":
			case "848ead0c-88b8-4da5-8b06-1c72399354df":
			case "aee755f7-7fd7-4767-aaa9-88caac8283bd":
			case "1ef51b8b-a51d-4cec-985b-860a733455d3":
			case "cc8f3c2e-6361-47db-be01-c4d75a0124f3":
			case "e8d0c3bf-b6e1-4ca5-8d40-d01b6a8f32f5":
			case "fbf4dbfa-d541-49b4-be01-f2e529247971":
			case "2979378a-9f47-48ba-a802-97a5ec5b79ac":
			case "1cbe9902-ee62-4b81-8c87-52eabc921a1a":
			case "e836925c-1f3b-4fef-9276-dc3a4859ec70":
			case "04a614a1-4f10-4f9d-a81f-d9bcbdf347cf":
			case "bacf952b-25d8-4f74-be53-6e0e98842560":
			case "d9a4e6a1-672a-454e-a5d8-c2d75cedbc46":
			case "e5b87ef8-4890-4ee4-bbf7-9dd1c91ffac7":
			case "ff144ca8-e52f-4cf8-8126-bd114116db7d":
			case "708b1f37-6bff-40f8-ae00-8e0ae94c0d15":
			case "dd08eed5-902e-4b0e-9ce9-de38f2c8f0ee":
			case "ed6f07ea-6345-4757-8aa8-79862b072108":
			case "703b44ad-e024-4437-b7fb-cc2fdcd8ee63":
			case "465d8041-6eea-4b77-a1e2-6828f3b73150":
			case "b17b4c0c-ad2e-4b57-8c9f-86cf52ee2194":
			case "14813a38-36e5-4dc7-9be0-1136ef7e1c5b":
			case "f8f462af-10e2-42a4-bae0-a3d2db30aa8d":
			case "62f02e8f-ddf7-4c76-bdca-e02feef515d5":
			case "66722baf-46b9-4e4c-a93e-e96a729daff7":
			case "84dddc56-afb2-4f8b-81ba-69462d255fc9":
			case "b8466314-6551-4b75-8fc1-77302bfce46d":
			case "f4278c09-ff03-4ff3-8007-3879b39403bf":
			case "7f4aac91-8412-4446-a2b7-20e4d994cfc6":
			case "fc846a96-0785-49ba-bf32-eb469e04a975":
			case "3f7d9af7-eb45-4ac7-b184-2e7e085ad502":
			case "1b30974e-5497-1029-9c29-001109b5c1d9":	//	ancien xof, déconnecté suite tentative avortée avec ML
			case "b0f66492-9b2d-426c-97b0-c40d934ce078":			// Sous-domaine demo0096
			case "45cad531-b89e-42e4-83a6-c178d32ca60a":
			case "26943608-60e7-440d-bc50-282fc7269dc8":
			case "a1411af7-6bb7-4723-b880-2b95bdf59321":
			case "c2980064-4348-4d4a-911c-0489488f00f1":
			case "fef25513-b650-4d07-bd2c-3e684406ecfe":
			case "ec2ff576-6abc-4416-9aaa-440da039200b":
			case "5e6611e2-9bec-4e77-8a96-6689bc2b1f35":
			case "68df2dee-4012-4354-b0a3-4ff507b0f86b":			// Sous-domaine demo0062
			case "43143834-cec9-4f74-ad8a-8e20c05f8b03":			// Sous-domaine demo0063
			case "bcad67ec-bd4a-4bb7-be27-9a1c9988f771":			// Sous-domaine demo0064
			case "b7dcb241-b4ee-41a2-bb9c-0714b1e97932":			// Sous-domaine demo0065
			case "febf4424-ae6f-486a-afde-c99b3909ca9e":			// Sous-domaine demo0066
			case "d823cc61-32f8-4008-9281-05b9b0238fe8":			// Sous-domaine demo0067
			case "1335d74d-de4d-4b7a-bdf0-cc1a9f4d2a69":			// Sous-domaine demo0068
			case "f081f297-f182-423d-be10-2ad62622f123":			// Sous-domaine demo0069
			case "1e2e4f69-8437-47e8-b9a3-d3002c3a632c":
			case "97aba99e-7f4d-465b-9b49-5df33404fdd5":			
				header("Location: http://www.google.com/mars/");
				exit;
			case "bcad67ec-bd4a-4bb7-be27-9a1c9988f771":	//	Anciennement demo0064
		}
    switch ($_SERVER["HTTP_HOST"]){
      case "localhost":
      case "famchar": //  Local ordinateur perso famille charron
      case "demo01.christophe-charron.info":
			case "xof.xsoftware.fr":							// Sous-domaine xof										13/11/2008
			case "xofbacasable.xsoftware.fr":			// Sous-domaine xof bac à sable				29/06/2009			
			case "reference.xsoftware.fr":				// Sous-domaine base de référence			13/11/2008
			case "test01.xsoftware.fr":						// Sous-domaine test01								14/11/2008
			case "demo0061.xsoftware.fr":				// Sous-domaine demo0061							30/11/2009	EPAC, à la demande de PCO
			case "demo0062.xsoftware.fr":				// Sous-domaine demo0062							21/12/2009	PCO
			case "demo0063.xsoftware.fr":				// Sous-domaine demo0063							21/12/2009	PCO
			case "demo0064.xsoftware.fr":				// Sous-domaine demo0064							21/12/2009	PCO
			case "demo0065.xsoftware.fr":				// Sous-domaine demo0065							21/12/2009	PCO
			case "demo0066.xsoftware.fr":				// Sous-domaine demo0066							21/12/2009	PCO		
			case "demo0067.xsoftware.fr":				// Sous-domaine demo0067							21/12/2009	PCO
			case "demo0068.xsoftware.fr":				// Sous-domaine demo0068							21/12/2009	PCO
			case "demo0069.xsoftware.fr":				// Sous-domaine demo0069							21/12/2009	PCO		
			case "demo0070.xsoftware.fr":				// Sous-domaine demo0070							21/12/2008
			case "demo0071.xsoftware.fr":				// Sous-domaine demo0071							21/12/2008
			case "demo0072.xsoftware.fr":				// Sous-domaine demo0072							21/12/2008			
			case "demo0073.xsoftware.fr":				// Sous-domaine demo0073							21/12/2008
			case "demo0074.xsoftware.fr":				// Sous-domaine demo0074							21/12/2008
			case "demo0075.xsoftware.fr":				// Sous-domaine demo0075							21/12/2008			
			case "demo0076.xsoftware.fr":				// Sous-domaine demo0076							21/12/2008
			case "demo0077.xsoftware.fr":				// Sous-domaine demo0077							21/12/2008
			case "demo0078.xsoftware.fr":				// Sous-domaine demo0078							21/12/2008			
			case "demo0079.xsoftware.fr":				// Sous-domaine demo0079							21/12/2008
			case "demo0080.xsoftware.fr":				// Sous-domaine demo0080							21/12/2008
			case "demo0081.xsoftware.fr":				// Sous-domaine demo0081							21/12/2008			
			case "demo0082.xsoftware.fr":				// Sous-domaine demo0082							21/12/2008
			case "demo0083.xsoftware.fr":				// Sous-domaine demo0083							21/12/2008
			case "demo0084.xsoftware.fr":				// Sous-domaine demo0084							21/12/2008			
			case "demo0085.xsoftware.fr":				// Sous-domaine demo0085							21/12/2008
			case "demo0086.xsoftware.fr":				// Sous-domaine demo0086							21/12/2008
			case "demo0087.xsoftware.fr":				// Sous-domaine demo0087							21/12/2008			
			case "demo0088.xsoftware.fr":				// Sous-domaine demo0088							21/12/2008
			case "demo0089.xsoftware.fr":				// Sous-domaine demo0089							21/12/2008
			case "demo0090.xsoftware.fr":				// Sous-domaine demo0090							21/12/2008			
			case "demo0091.xsoftware.fr":				// Sous-domaine demo0091							21/12/2008
			case "demo0092.xsoftware.fr":				// Sous-domaine demo0092							21/12/2008
			case "demo0093.xsoftware.fr":				// Sous-domaine demo0093							21/12/2008			
			case "demo0094.xsoftware.fr":				// Sous-domaine demo0094							21/12/2008			
			case "demo0095.xsoftware.fr":				// Sous-domaine demo0095							21/12/2008
			case "demo0096.xsoftware.fr":				// Sous-domaine demo0096							21/12/2008
			case "demo0097.xsoftware.fr":				// Sous-domaine demo0097							21/12/2008			
			case "demo0098.xsoftware.fr":				// Sous-domaine demo0098							21/12/2008
			case "demo0099.xsoftware.fr":				// Sous-domaine demo0099							21/12/2008
			case "demo0100.xsoftware.fr":				// Sous-domaine demo0100							21/12/2008			
        header("Location: ./exploit/_graal_fen_identification_01.php?q=$toto&");
        exit;
        break;
      default:
        include('./exploit/pagesparticulieres/index_ie.inc.php');
        break;
    }
    break;
}
?>
