// index.js

exports.handler = async (event) => {
    try {
        // Placeholder code for Iris classification
        const result = "Iris versicolor";

        // Return the result
        return {
            statusCode: 200,
            body: JSON.stringify({ result }),
        };
    } catch (error) {
        console.error('Error:', error);
        return {
            statusCode: 500,
            body: JSON.stringify({ error: 'Internal Server Error' }),
        };
    }
};
