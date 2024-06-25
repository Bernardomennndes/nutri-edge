import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:nutri_edge/models/diet.dart';
import 'package:nutri_edge/models/objectives.dart';
import 'package:nutri_edge/models/profile.dart';

const transformedObjective = <Objectives, String>{
  Objectives.cutting: 'Perda de peso',
  Objectives.health: 'Se manter saudável',
  Objectives.strength: 'Ganhar Força',
  Objectives.hypertrophy: 'Hipertrofia',
};

class GptApi {
  static Future<Diet> request({
    required final Objectives selectedObjective,
    required final List<String> selectedIntolerances,
    required final List<String> alergies,
    required final Profile profileMetrics,
  }) async {
    // final apiKey = Platform.environment['API_KEY'];
    const apiKey = '';
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
    final prompt = """
      Faça uma dieta para um indivíduo do sexo ${profileMetrics.gender} de ${profileMetrics.age} anos, 
      que tenha ${profileMetrics.height} cm de altura, peso igual a ${profileMetrics.weight} kg 
      com o objetivo de ${transformedObjective[selectedObjective]} 
      ${selectedIntolerances.isNotEmpty ? ', intolerante a ${selectedIntolerances.join(' e ')}' : ''} 
      ${alergies.isNotEmpty ? ', com alergia a ${alergies.join(',')}' : ''}. 
      Retorne a resposta em formato json na seguinte estrutrura, 
      { totalCalories: number, meals: [ { name: string, calories: number,
      foods: [ { name: string, calories: number, quantity: number, unitMeasurement: string },... ] },... ] }. 
      Lembre-se que o atributo unitMeasurement deve ser retornado em formato de sigla como por exemplo, 'un', 'xic', 'g'. 
      Dê preferencia para sempre usar a unidade de medida gramas quando for possível. 
      O nome da refeição deverá conter apenas o nome dela, podendo ter preposições como 'de', 'da',
      e não conteúdos como quantidade de calorias. Cada refeição deverá ser retornada com cada alimento separado
      com suas respectivas calorias, quantidades e nomes, por exemplo, na refeição café da manhã, cada alimento deve conter
      a quantidade de cada um, suas calorias e nomes separados, cada ingrediente deve ser retornado como um objeto food
      dentro do array de foods, e não como um uma propriedade de ingredientes. Não deve ser acrescentado nenhuma
      propriedade no JSON a mais, apenas aquelas do exemplo citado acima. Não deve ser retornado nenhum outro tipo de texto
      como por exemplo, um tópico de observações ou de lembre-se, apenas o json requisitado. 
      Varie os alimentos em cada resposta para que cada dieta não fique parecida com a outra.
    """;
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    final textResponse =
        response.text!.replaceAll("json", "").replaceAll("```", "");
    final json = jsonDecode(textResponse);
    final diet = Diet.fromJson(json);

    return diet;
  }
}
