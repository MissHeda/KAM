class CfgWeapons
{
    class ToolKit;
    class Attachable_Helistretcher: ToolKit
    {
        author = "Battlekeeper";
        picture = QPATHTOF(ui\stretcher.paa);
        displayName = CSTRING(Helistretcher_Display);
        descriptionShort = CSTRING(Helistretcher_Desc);
        class ItemInfo
        {
            mass = 20;
            uniformModel = "\A3\Weapons_F\Items\Toolkit";
            type = 620;
            allowedSlots[] = {801,701,901};
            scope = 0;
        };
    };

    class ItemCore;
	class InventoryItem_Base_F;

	 class Medic_Bag: ItemCore {

        type = 4096;
        detectRange = -1;
        author = "Digii, Miss Heda";
        simulation = "ItemMineDetector";
        displayName = CSTRING(Medic_Bag_Display);
        descriptionShort = CSTRING(Medic_Bag_Desc);
        scope = 2;
        cost = 1000;
        side = 3;
        allowedslots[] = {901};
        model = QPATHTOF(models\medicBag\medicbag.p3d);
        editorPreview = QPATHTOF(ui\MedicBagEditorPreview.paa);
        picture = QPATHTOF(ui\MedicBagIcon.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 45;
        };
    };

    class ItemCore;
	class InventoryItem_Base_F;

	 class Medic_armband_item: ItemCore {

        type = 4096;
        detectRange = -1;
        author = "Digii, Miss Heda";
        simulation = "ItemMineDetector";
        displayName = CSTRING(Medic_Bag_Display);  //TODO
        descriptionShort = CSTRING(Medic_Bag_Desc);  //TODO
        scope = 2;
        cost = 20;
        side = 3;
        allowedslots[] = {901};
        model = QPATHTOF(models\armband\armband.p3d);
        editorPreview = QPATHTOF(ui\ArmbandWhiteCross.paa);
        picture = QPATHTOF(ui\ArmbandWhiteCross.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };
};