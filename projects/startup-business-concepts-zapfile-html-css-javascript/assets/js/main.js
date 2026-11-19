document.addEventListener('DOMContentLoaded', () => {
    const dropZone = document.querySelector('.drop-zone');
    const fileInput = document.querySelector('.drop-zone__input');
    const progressBar = document.querySelector('#uploadProgress');
    const progress = document.querySelector('.progress');
    const shareLink = document.querySelector('#shareLink');
    const linkInput = document.querySelector('#linkInput');
    const copyButton = document.querySelector('#copyButton');

    dropZone.addEventListener('click', () => fileInput.click());

    dropZone.addEventListener('dragover', (e) => {
        e.preventDefault();
        dropZone.classList.add('drop-zone--over');
    });

    ['dragleave', 'dragend'].forEach(type => {
        dropZone.addEventListener(type, () => {
            dropZone.classList.remove('drop-zone--over');
        });
    });

    dropZone.addEventListener('drop', (e) => {
        e.preventDefault();
        
        if (e.dataTransfer.files.length) {
            fileInput.files = e.dataTransfer.files;
            uploadFile(e.dataTransfer.files[0]);
        }
    });

    fileInput.addEventListener('change', () => {
        if (fileInput.files.length) {
            uploadFile(fileInput.files[0]);
        }
    });

    function uploadFile(file) {
        const formData = new FormData();
        formData.append('file', file);

        progressBar.classList.remove('hidden');
        
        fetch('upload.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                shareLink.classList.remove('hidden');
                linkInput.value = data.url;
            } else {
                alert(data.error);
            }
        })
        .catch(error => {
            alert('Upload failed. Please try again.');
        });
    }

    copyButton.addEventListener('click', () => {
        linkInput.select();
        document.execCommand('copy');
    });
});