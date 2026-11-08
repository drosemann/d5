document.addEventListener('DOMContentLoaded', () => {
    // DOM Elements
    const quizSelection = document.getElementById('quiz-selection');
    const quizContainer = document.getElementById('quiz-container');
    const quizTitle = document.getElementById('quiz-title');
    const questionText = document.getElementById('question-text');
    const optionsContainer = document.getElementById('options-container');
    const prevBtn = document.getElementById('prev-btn');
    const nextBtn = document.getElementById('next-btn');
    const submitBtn = document.getElementById('submit-btn');
    const resultContainer = document.getElementById('result-container');
    const scoreDisplay = document.getElementById('score-display');
    const restartBtn = document.getElementById('restart-btn');
    const quizList = document.getElementById('quiz-list');
    const quizProgress = document.getElementById('quiz-progress');

    // Quiz state
    let currentQuiz = null;
    let currentQuestionIndex = 0;
    let userAnswers = [];
    let score = 0;

    // Initialize the app
    function init() {
        loadQuizList();
        setupEventListeners();
    }

    // Load the list of available quizzes
    function loadQuizList() {
        quizList.innerHTML = '';
        
        quizData.quizzes.forEach((quiz, index) => {
            const quizElement = document.createElement('div');
            quizElement.className = 'quiz-option';
            quizElement.innerHTML = `
                <h3>${quiz.title}</h3>
                <p>${quiz.questions.length} Fragen</p>
                <small>${quiz.description || ''}</small>
            `;
            quizElement.addEventListener('click', () => startQuiz(index));
            quizList.appendChild(quizElement);
        });
    }

    // Set up event listeners
    function setupEventListeners() {
        prevBtn.addEventListener('click', showPreviousQuestion);
        nextBtn.addEventListener('click', showNextQuestion);
        submitBtn.addEventListener('click', showResults);
        restartBtn.addEventListener('click', restartQuiz);
    }

    // Start a quiz
    function startQuiz(quizIndex) {
        currentQuiz = quizData.quizzes[quizIndex];
        currentQuestionIndex = 0;
        userAnswers = new Array(currentQuiz.questions.length).fill(null);
        score = 0;

        quizTitle.textContent = currentQuiz.title;
        quizSelection.classList.add('hidden');
        quizContainer.classList.remove('hidden');
        
        showQuestion();
    }

    // Display the current question
    function showQuestion() {
        const question = currentQuiz.questions[currentQuestionIndex];
        questionText.textContent = question.question;
        quizProgress.textContent = `Frage ${currentQuestionIndex + 1} von ${currentQuiz.questions.length}`;

        // Clear previous options
        optionsContainer.innerHTML = '';

        // Add new options
        question.options.forEach((option, index) => {
            const optionBtn = document.createElement('div');
            optionBtn.className = 'option';
            
            if (userAnswers[currentQuestionIndex] === index) {
                optionBtn.classList.add('selected');
            }
            
            optionBtn.textContent = option;
            optionBtn.addEventListener('click', () => selectOption(index));
            optionsContainer.appendChild(optionBtn);
        });

        updateNavigationButtons();
    }

    // Handle option selection
    function selectOption(optionIndex) {
        // Remove selected class from all options
        const options = document.querySelectorAll('.option');
        options.forEach(option => option.classList.remove('selected'));
        
        // Add selected class to clicked option
        options[optionIndex].classList.add('selected');
        
        // Save the user's answer
        userAnswers[currentQuestionIndex] = optionIndex;
        
        // Enable next button
        nextBtn.disabled = false;
    }

    // Show previous question
    function showPreviousQuestion() {
        if (currentQuestionIndex > 0) {
            currentQuestionIndex--;
            showQuestion();
        }
    }

    // Show next question
    function showNextQuestion() {
        if (currentQuestionIndex < currentQuiz.questions.length - 1) {
            currentQuestionIndex++;
            showQuestion();
        }
    }

    // Update navigation buttons state
    function updateNavigationButtons() {
        prevBtn.disabled = currentQuestionIndex === 0;
        nextBtn.disabled = userAnswers[currentQuestionIndex] === null;
        
        if (currentQuestionIndex === currentQuiz.questions.length - 1) {
            nextBtn.classList.add('hidden');
            submitBtn.classList.remove('hidden');
        } else {
            nextBtn.classList.remove('hidden');
            submitBtn.classList.add('hidden');
        }
        submitBtn.classList.toggle('hidden', !isLastQuestion || userAnswers[currentQuestionIndex] === null);
    }

    // Show quiz results
    function showResults() {
        // Calculate final score
        const totalQuestions = currentQuiz.questions.length;
        const percentage = Math.round((score / totalQuestions) * 100);
        
        // Display results
        quizContainer.classList.add('hidden');
        resultContainer.classList.remove('hidden');
        
        let resultMessage = `Sie haben ${score} von ${totalQuestions} Fragen richtig beantwortet.\n`;
        resultMessage += `Das entspricht ${percentage}%.\n\n`;
        
        if (percentage >= 80) {
            resultMessage += 'Hervorragende Leistung! Sie haben das Quiz mit Bravour bestanden! 🎉';
        } else if (percentage >= 60) {
            resultMessage += 'Gute Arbeit! Sie haben das Quiz bestanden. 👍';
        } else if (percentage >= 40) {
            resultMessage += 'Fast geschafft! Üben Sie noch ein wenig weiter. 💪';
        } else {
            resultMessage += 'Leider nicht bestanden. Bitte wiederholen Sie den Stoff und versuchen Sie es erneut. 📚';
        }
        
        scoreDisplay.textContent = resultMessage;
    }

    // Restart the quiz
    function restartQuiz() {
        resultContainer.classList.add('hidden');
        quizSelection.classList.remove('hidden');
    }

    // Initialize the application
    init();
});
