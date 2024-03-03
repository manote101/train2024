import torch
import torch.nn as nn
import torch.optim as optim

# Define the neural network architecture
class NeuralNet(nn.Module):
    def __init__(self):
        super(NeuralNet, self).__init__()
        self.fc = nn.Linear(1, 1)  # Fully connected layer

    def forward(self, x):
        x = self.fc(x)
        return x

# Create an instance of the neural network
model = NeuralNet()

# Define the loss function (mean squared error) and optimizer
criterion = nn.MSELoss()
optimizer = optim.SGD(model.parameters(), lr=0.01)

# Generate some training data
x_train = torch.tensor([[1], [2], [3], [4], [5], [6], [8], [10], [11]], dtype=torch.float32)
y_train = 2 * x_train + 1

# Training loop
num_epochs = 1000
for epoch in range(num_epochs):
    # Forward pass
    outputs = model(x_train)
    loss = criterion(outputs, y_train)

    # Backward and optimize
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()

    # Print progress
    if (epoch + 1) % 100 == 0:
        print(f'Epoch [{epoch+1}/{num_epochs}], Loss: {loss.item():.4f}')

# Test the trained model
x_test = torch.tensor([[7], [9], [13]], dtype=torch.float32)
y_test = 2 * x_test + 1
with torch.no_grad():
    predicted = model(x_test)
    predicted_values = predicted.flatten()
    ground_truth_values = y_test.flatten()
    accuracy = torch.mean((predicted_values == ground_truth_values).float()) * 100

    print("Predicted values:", predicted_values)
    print("Ground truth values:", ground_truth_values)
#    print(f"Accuracy: {accuracy.item():.2f}%")

