import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression

class HousePricePredictor:
    def __init__(self):
        self.model = LinearRegression()
        
    def load_and_train(self, data_path):
        data = pd.read_csv(data_path)
        X = data[['Size', 'Rooms', 'Year', 'DistanceToCenter']]
        y = data['Price']
        
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)
        self.model.fit(X_train, y_train)
        
    def predict(self, features):
        return self.model.predict([features])[0]