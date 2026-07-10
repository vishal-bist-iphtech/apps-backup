import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150)
                    .foregroundColor(.accentColor)
                
                Image(systemName: "person.3.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
            }
                
                Text("Welcome to my App")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                Text("Description text")
                    .font(.title2)
                
            }
            .padding()
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}
