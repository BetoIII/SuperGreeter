' entry point of  MainScene
sub Init()
    ' set background color for scene. Applied only if backgroundUri has empty value
    m.top.backgroundColor = "0x10100e"
    m.loadingIndicator = m.top.FindNode("loadingIndicator") ' store loadingIndicator node to m
    InitScreenStack()
    ShowGridScreen()
    RunContentTask()
    m.emojiOnRoku = createObject("roSGNode", "ComponentLibrary")
    m.emojiOnRoku.id = "EmojiOnRoku"
    m.emojiOnRoku.uri = "https://github.com/KasperGam/EmojiOnRoku/releases/download/v1.0.0/release.zip"

    m.emojiOnRoku.observeField("loadStatus", "onLibLoaded")
end sub

function onLibLoaded()
    if m.emojiOnRoku.loadStatus = "ready"
        setupEmojiLabel()
    else if m.emojiOnRoku.loadStatus = "failed"
        print "Failed to load emoji Library!"
    end if
end function

function setupEmojiLabel()
    if m.emojiLabel = Invalid
        testStr = "Hello 👨🏻‍🦰! I am happy 😊 to see you. See emoji 👩🏽‍🦱 chars!"

        m.emojiLabel = createObject("roSGNode", "EmojiOnRoku:EmojiLabel")
        m.emojiLabel.translation = [200, 500]
        m.emojiLabel.height = 24
        m.emojiLabel.color = &h00AAEEFF
        m.emojiLabel.text = testStr
        m.top.appendChild(m.emojiLabel)
    end if
end function

' The OnKeyEvent() function receives remote control key events
function OnkeyEvent(key as String, press as Boolean) as Boolean
    result = false
    if press
        ' handle "back" key press
        if key = "back"
            numberOfScreens = m.screenStack.Count()
            ' close top screen if there are two or more screens in the screen stack
            if numberOfScreens > 1
                CloseScreen(invalid)
                result = true
            end if
        end if
    end if
    ' The OnKeyEvent() function must return true if the component handled the event,
    ' or false if it did not handle the event.
    return result
end function
