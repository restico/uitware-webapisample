FROM mcr.microsoft.com/dotnet/sdk:7.0 as build
WORKDIR /app
ADD . ./
RUN dotnet restore
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app/out .
EXPOSE 80
ENTRYPOINT ["dotnet", "SampleWebApiAspNetCore.dll"]