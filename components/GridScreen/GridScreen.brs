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
    m.wifi = m.top.FindNode("wifi")
    m.access = m.top.FindNode("access")
    m.reservation = m.top.FindNode("reservation")
    m.checkInLabel = m.top.FindNode("checkInLabel")
    m.checkInTime = m.top.FindNode("checkInTime")
    m.checkOutLabel = m.top.FindNode("checkOutLabel")
    m.checkOutTime = m.top.FindNode("checkOutTime")
    m.menu = m.top.FindNode("menu")
    m.welcome = m.top.FindNode("welcomeButton")
    m.home = m.top.FindNode("homeButton")
    m.local = m.top.FindNode("localButton")
    menuEmojis()
    setFonts()
end sub

function setFonts()
    m.wifi.font.size = 12
    m.access.font.size = 16
    m.reservation.font.size = 12
    m.checkInLabel.font.size = 18
    m.checkOutLabel.font.size = 18
    m.menu.font.size = 12

    ' Dyamic Labels from json
    m.longDescriptionLabel.font.size = m.longDescriptionLabel.font.size-8
    m.checkInTime.font.size = m.checkInTime.font.size-8
    m.shortDescriptionLabel.font.size = m.shortDescriptionLabel.font.size-8
    m.checkOutTime.font.size = m.checkOutTime.font.size-8
end function

function menuEmojis()
    welcomeButton = createObject("roSGNode", "EmojiLabel")
    welcomeButton.text = "👋 " + "Welcome!"
    welcomeButton.translation=[70, 25]
    welcomeButton.height = 16
    welcomeButton.vertAlign = "center"
    welcomeButton.color = &h00666666
    m.welcome.appendChild(welcomeButton)

    homeButton = createObject("roSGNode", "EmojiLabel")
    homeButton.text = "🏡 " + "Manual"
    homeButton.translation=[80, 25]
    homeButton.height = 16
    homeButton.vertAlign = "center"
    homeButton.color = &h00666666
    m.home.appendChild(homeButton)

    localButton = CreateObject("roSGNode", "EmojiLabel")
    localButton.text = "🍜 " + "Recommended"
    localButton.translation=[40, 25]
    localButton.height = 16
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
