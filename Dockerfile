FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine as builder
ARG BOT_VERSION="2.7.3"
RUN apk add curl unzip
RUN curl -L -o source.zip "https://github.com/PCJones/Ultimate-Splinterlands-Bot-V2/archive/refs/tags/v${BOT_VERSION}.zip"
RUN unzip source.zip || true
RUN rm -f source.zip
RUN dotnet build ./Ultimate-Splinterlands-Bot-V2-${BOT_VERSION}/Ultimate\ Splinterlands\ Bot\ V2.csproj 
RUN dotnet publish ./Ultimate-Splinterlands-Bot-V2-${BOT_VERSION}/Ultimate\ Splinterlands\ Bot\ V2.csproj -o /bot -c Release -r linux-musl-x64 /p:PublishTrimmed=true
RUN cp -r ./Ultimate-Splinterlands-Bot-V2-${BOT_VERSION}/bin/Release/net5.0/data /bot/data

FROM mcr.microsoft.com/dotnet/runtime:5.0-alpine
WORKDIR /bot/
COPY --from=builder /bot ./
COPY --from=builder /bot/data ./data
CMD ["dotnet", "/bot/Ultimate Splinterlands Bot V2.dll"]