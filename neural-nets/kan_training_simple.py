import tensorflow as tf

class KANLayer(tf.keras.layers.Layer):
    def __init__(self, units=32):
        super(KANLayer, self).__init__()
        self.units = units

    def build(self, input_shape):
        self.w1 = self.add_weight(shape=(input_shape[-1], self.units),
                                  initializer='random_normal',
                                  trainable=True)
        self.b1 = self.add_weight(shape=(self.units,),
                                  initializer='random_normal',
                                  trainable=True)

    def call(self, inputs):
        phi_1 = tf.sin(tf.matmul(inputs, self.w1) + self.b1)
        phi_2 = tf.cos(tf.matmul(inputs, self.w1) + self.b1)
        phi_3 = tf.tanh(tf.matmul(inputs, self.w1) + self.b1)
        summed = tf.reduce_sum(phi_1 + phi_2 + phi_3, axis=1)
        return tf.expand_dims(summed, axis=-1)  # Ensure the output is 2D

# Example use of KANLayer in a model
inputs = tf.keras.Input(shape=(3,))
x = KANLayer(units=10)(inputs)
x = tf.keras.layers.Dense(1, activation='tanh')(x)
model = tf.keras.Model(inputs, x)

model.compile(optimizer='adam', loss='mse')

# Example data
x_train = tf.random.normal((100, 3))
y_train = tf.random.normal((100, 1))

model.fit(x_train, y_train, epochs=10)

# Test the model
x_test = tf.random.normal((1, 3))
print(x_test)
print(model.predict(x_test))