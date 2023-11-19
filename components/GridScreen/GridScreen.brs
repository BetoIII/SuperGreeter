' entry point of GridScreen
' Note that we need to import this file in GridScreen.xml using relative path.
sub Init()
    m.rowList = m.top.FindNode("rowList")
    m.rowList.SetFocus(true)
    m.longDescriptionLabel = m.top.FindNode("longDescriptionLabel")
    m.shortDescriptionLabel = m.top.FindNode("shortDescriptionLabel")
    m.titleLabel = m.top.FindNode("titleLabel")
    m.reservationLabel = m.top.FindNode("reservationLabel")
    ' observe rowItemFocused so we can know when another item of rowList will be focused
    m.rowList.ObserveField("rowItemFocused", "OnItemFocused")
    m.menu = m.top.FindNode("menu")
    menuEmojis()
end sub

function menuEmojis()
    welcomeMenu = createObject("roSGNode", "EmojiLabel")
    welcomeMenu.text = "👋 " + "Welcome!"
    welcomeMenu.translation=[50, 25]
    welcomeMenu.height = 18
    welcomeMenu.vertAlign = "center"
    welcomeMenu.color = &h00444444
    m.menu.appendChild(welcomeMenu)
end function

sub OnItemFocused() ' invoked when another item is focused
    focusedIndex = m.rowList.rowItemFocused ' get position of focused item
    row = m.rowList.content.GetChild(focusedIndex[0]) ' get all items of row
    item = row.GetChild(focusedIndex[1]) ' get focused item
    m.shortDescriptionLabel.text = item.shortDescription
    m.longDescriptionLabel.text = item.longDescription
    m.titleLabel.text = "Welcome, "
    m.titleLabel.text += item.title
    m.reservationLabel.text = item.id
end sub
