Ext.Require("Common.lua")
Ext.Require("Util.lua")

local debugMode = true

local function AddedToHandler(object, inventoryHolder, addType)
    if debugMode then
        print('-- AddedToHandler')
        print('Object:           ', object)
        print('Inventory holder: ', inventoryHolder)
        print('Add type:         ', addType)
        e = Ext.Entity.Get(object)
        if (e) then
            if (e.Tag) then
                print('Tags:')
                _D(e.Tag)
            end
            -- _D(e:GetAllComponents())
            if (e.OriginalTemplate) then
                print('Original template:')
                _D(e.OriginalTemplate)
            end
        end
    end

end

local function RemovedFromHandler(object, inventoryHolder)
    if debugMode then
        print('-- RemovedFromHandler')
        print('Object:           ', object)
        print('Inventory holder: ', inventoryHolder)
        e = Ext.Entity.Get(object)
        if (e and e.Tag) then
            print('Tags:')
            _D(e.Tag)
        end
    end
end


Ext.Osiris.RegisterListener("AddedTo", 3, "before", AddedToHandler)
Ext.Osiris.RegisterListener("RemovedFrom", 2, "after", RemovedFromHandler)
