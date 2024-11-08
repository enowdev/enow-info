let editMode = false;

// NUI Message Handler
window.addEventListener('message', function(event) {
    const data = event.data;
    
    switch(data.action) {
        case 'openEdit':
            openEditMode();
            break;
        case 'updatePlayerInfo':
            updatePlayerInfo(data);
            break;
    }
});

// Open Edit Mode
function openEditMode() {
    editMode = true;
    $('.edit-menu').show();
    enableDragging();
}

// Close Menu
$('.close-menu').click(function() {
    editMode = false;
    $('.edit-menu').hide();
    disableDragging();
    $.post('https://enow-info/closeEdit');
});

// Toggle Player Info
$('#toggle-playerinfo').change(function() {
    $('.player-info').toggle(this.checked);
});

// Font Size Slider
$('#font-size').on('input', function() {
    const size = $(this).val();
    $('.glow-text').css('font-size', size + 'px');
    $('.info-row span').css('font-size', (size * 0.6) + 'px'); // Proportional size for info text
});

// Save Position
$('#save-position').click(function() {
    const positions = {
        serverName: {
            top: $('.server-name').css('top'),
            left: $('.server-name').css('left')
        },
        playerInfo: {
            top: $('.player-info').css('top'),
            right: $('.player-info').css('right')
        },
        fontSize: $('#font-size').val()
    };
    
    $.post('https://enow-info/savePositions', JSON.stringify(positions));
    disableDragging();
    $('.edit-menu').hide();
    editMode = false;
    $.post('https://enow-info/closeEdit');
});

// Enable Dragging
function enableDragging() {
    $('.draggable').draggable({
        start: function() {
            $(this).addClass('dragging');
        },
        stop: function() {
            $(this).removeClass('dragging');
        }
    });
}

// Disable Dragging
function disableDragging() {
    $('.draggable').draggable('destroy');
}

// Update Player Info
function updatePlayerInfo(data) {
    animateValue('playerid', `ID: ${data.playerid}`);
    animateValue('bank', `$${numberWithCommas(data.bank)}`);
}

function animateValue(elementId, newValue) {
    const element = document.getElementById(elementId);
    if (element && element.textContent !== newValue) {
        element.textContent = newValue;
        element.classList.add('value-updated');
        setTimeout(() => {
            element.classList.remove('value-updated');
        }, 300);
    }
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
} 