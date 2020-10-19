import React, {useEffect, useState} from 'react';
import {SafeAreaView, Text, TextInput, NativeModules} from 'react-native';

const App = () => {
  const [text, setText] = useState('');

  useEffect(() => {
    console.log(text);

    NativeModules.WidgetHelper.UpdateNote(text);
  }, [text]);

  return (
    <SafeAreaView style={styles.container}>
      <Text>Entre com seu texto</Text>
      <TextInput onChangeText={setText} style={styles.input} />
    </SafeAreaView>
  );
};

const styles = {
  container: {flex: 1, alignItems: 'center', justifyContent: 'center'},
  input: {borderColor: 'black', borderWidth: 1, width: '80%'},
};

export default App;
