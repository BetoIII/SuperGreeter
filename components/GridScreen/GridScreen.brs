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
    m.welcome = m.top.FindNode("welcomeButton")
    m.home = m.top.FindNode("homeButton")
    m.local = m.top.FindNode("localButton")
    menuEmojis()
    setFonts()
end sub

function setFonts()
    m.menu.font.size = 12
end function

function menuEmojis()
    welcomeButton = createObject("roSGNode", "EmojiLabel")
    welcomeButton.text = "👋 " + "Welcome!"
    welcomeButton.translation=[70, 25]
    welcomeButton.height = 18
    welcomeButton.vertAlign = "center"
    welcomeButton.color = &h00666666
    m.welcome.appendChild(welcomeButton)

    homeButton = createObject("roSGNode", "EmojiLabel")
    homeButton.text = "🏡 " + "Manual"
    homeButton.translation=[80, 25]
    homeButton.height = 18
    homeButton.vertAlign = "center"
    homeButton.color = &h00666666
    m.home.appendChild(homeButton)

    localButton = CreateObject("roSGNode", "EmojiLabel")
    localButton.text = "🍜 " + "Recommended"
    localButton.translation=[40, 25]
    localButton.height = 18
    localButton.vertAlign = "center"
    localButton.color = &h00666666
    m.local.appendChild(localButton)
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
