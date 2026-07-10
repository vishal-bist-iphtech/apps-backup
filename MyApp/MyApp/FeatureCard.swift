import SwiftUI

struct FeatureCard: View {
    
    let iconName: String
    let description: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50)
                .padding(.trailing,10)
            
            Text(description)
            Spacer()
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.blue)
        .cornerRadius(12)
        
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(iconName: "person.2.fill", description: "A multiline description about a feature paired with the image on the left.")
    }
}
