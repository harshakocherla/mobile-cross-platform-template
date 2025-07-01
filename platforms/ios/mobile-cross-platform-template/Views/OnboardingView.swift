import SwiftUI

struct OnboardingPage {
    let title: String
    let description: String
    let imageName: String
}

struct OnboardingView: View {
    @Binding var showingOnboarding: Bool
    @State private var currentPage = 0
    
    private let pages = [
        OnboardingPage(
            title: "Welcome to Love It or Leave It!",
            description: "A fun game to discover what you and your partner love or hate.",
            imageName: "heart.fill"
        ),
        OnboardingPage(
            title: "How to Play",
            description: "Take turns revealing prompts and see if you both love it or leave it. Match answers to score points!",
            imageName: "gamecontroller.fill"
        ),
        OnboardingPage(
            title: "Multiple Game Modes",
            description: "Choose from Standard, Dealbreaker, or Rapid Fire modes for different gameplay experiences.",
            imageName: "star.fill"
        ),
        OnboardingPage(
            title: "Ready to Start?",
            description: "Enter your names and begin your journey of discovery!",
            imageName: "person.2.fill"
        )
    ]
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                TabView(selection: $currentPage) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        OnboardingPageView(page: pages[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
                Button(action: {
                    if currentPage < pages.count - 1 {
                        withAnimation {
                            currentPage += 1
                        }
                    } else {
                        showingOnboarding = false
                    }
                }) {
                    Text(currentPage < pages.count - 1 ? "Next" : "Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

struct OnboardingPageView: View {
    let page: OnboardingPage
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: page.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.accentColor)
                .padding()
            
            Text(page.title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text(page.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(showingOnboarding: .constant(true))
    }
} 